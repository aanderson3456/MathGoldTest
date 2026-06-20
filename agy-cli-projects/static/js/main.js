// Javascript Logic for BigQuery Release Pulse

document.addEventListener('DOMContentLoaded', () => {
    // State Variables
    let allReleases = [];
    let selectedUpdate = null;
    let currentFilterType = 'all';
    let currentSearchQuery = '';

    // DOM Elements
    const refreshBtn = document.getElementById('refresh-btn');
    const retryBtn = document.getElementById('retry-btn');
    const refreshIcon = document.getElementById('refresh-icon');
    const statusDot = document.getElementById('status-dot');
    const statusText = document.getElementById('status-text');
    
    const searchInput = document.getElementById('search-input');
    const filterButtons = document.querySelectorAll('.filter-btn');
    
    const loadingState = document.getElementById('loading-state');
    const errorState = document.getElementById('error-state');
    const errorMessage = document.getElementById('error-message');
    const feedContainer = document.getElementById('feed-container');
    
    // Stats Elements
    const statTotal = document.getElementById('stat-total');
    const statFeatures = document.getElementById('stat-features');
    const statIssues = document.getElementById('stat-issues');
    const statAnnouncements = document.getElementById('stat-announcements');
    
    // Tweet Composer Elements
    const composerTip = document.getElementById('composer-tip');
    const composerContent = document.getElementById('composer-content');
    const tweetTextarea = document.getElementById('tweet-textarea');
    const charCounter = document.getElementById('char-counter');
    const tweetBtn = document.getElementById('tweet-btn');
    const clearSelectBtn = document.getElementById('clear-select-btn');

    // Fetch Release Notes
    async function fetchReleaseNotes() {
        setLoadingState(true);
        try {
            const response = await fetch('/api/releases');
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const result = await response.json();
            
            if (result.status === 'success') {
                allReleases = result.data;
                renderFeed();
                updateStats();
                setErrorState(false);
            } else {
                throw new Error(result.message || 'Unknown error occurred while fetching.');
            }
        } catch (error) {
            console.error('Error fetching release notes:', error);
            setErrorState(true, error.message);
        } finally {
            setLoadingState(false);
        }
    }

    // Set Loading UI States
    function setLoadingState(isLoading) {
        if (isLoading) {
            refreshBtn.classList.add('loading');
            refreshBtn.disabled = true;
            statusDot.className = 'status-dot loading';
            statusText.textContent = 'Updating...';
            loadingState.classList.remove('hidden');
            errorState.classList.add('hidden');
        } else {
            refreshBtn.classList.remove('loading');
            refreshBtn.disabled = false;
            statusDot.className = 'status-dot pulsed';
            statusText.textContent = 'Connected';
            loadingState.classList.add('hidden');
        }
    }

    // Set Error UI States
    function setErrorState(isError, message = '') {
        if (isError) {
            errorState.classList.remove('hidden');
            feedContainer.innerHTML = '';
            statusDot.className = 'status-dot error';
            statusText.textContent = 'Offline / Error';
            errorMessage.textContent = message || 'An error occurred while connecting to the BigQuery feed. Please try again.';
        } else {
            errorState.classList.add('hidden');
        }
    }

    // Calculate and Update Dashboard Stats
    function updateStats() {
        let totalCount = 0;
        let featureCount = 0;
        let issueCount = 0;
        let announcementCount = 0;

        allReleases.forEach(entry => {
            entry.items.forEach(item => {
                totalCount++;
                if (item.type === 'Feature') featureCount++;
                else if (item.type === 'Issue') issueCount++;
                else if (item.type === 'Announcement') announcementCount++;
            });
        });

        statTotal.textContent = totalCount;
        statFeatures.textContent = featureCount;
        statIssues.textContent = issueCount;
        statAnnouncements.textContent = announcementCount;
    }

    // Render Feed based on Search and Filter Types
    function renderFeed() {
        feedContainer.innerHTML = '';
        
        let hasContent = false;

        allReleases.forEach(entry => {
            // Filter sub-items within this entry date
            const filteredItems = entry.items.filter(item => {
                // Check filter type
                const matchesType = 
                    currentFilterType === 'all' || 
                    (currentFilterType === 'other' && !['Feature', 'Issue', 'Announcement'].includes(item.type)) ||
                    item.type === currentFilterType;
                
                // Check search term
                const searchLower = currentSearchQuery.toLowerCase();
                const matchesSearch = 
                    currentSearchQuery === '' || 
                    entry.date.toLowerCase().includes(searchLower) ||
                    item.type.toLowerCase().includes(searchLower) ||
                    item.text.toLowerCase().includes(searchLower);

                return matchesType && matchesSearch;
            });

            if (filteredItems.length > 0) {
                hasContent = true;
                
                // Day Group Container
                const dayGroup = document.createElement('div');
                dayGroup.className = 'day-group';
                
                // Day Header
                const dayHeader = document.createElement('div');
                dayHeader.className = 'day-header';
                
                const dayDate = document.createElement('h3');
                dayDate.className = 'day-date';
                dayDate.textContent = entry.date;
                
                const dayLine = document.createElement('div');
                dayLine.className = 'day-line';
                
                dayHeader.appendChild(dayDate);
                dayHeader.appendChild(dayLine);
                dayGroup.appendChild(dayHeader);
                
                // Cards Wrapper
                const dayCards = document.createElement('div');
                dayCards.className = 'day-cards';
                
                filteredItems.forEach((item, index) => {
                    const card = document.createElement('article');
                    card.className = 'card update-card';
                    card.setAttribute('data-type', item.type);
                    
                    // Add selected state if active
                    const isSelected = selectedUpdate && 
                        selectedUpdate.id === entry.id && 
                        selectedUpdate.index === index;
                    if (isSelected) {
                        card.classList.add('selected');
                    }
                    
                    // Badge styles
                    let badgeClass = 'badge-other';
                    if (item.type === 'Feature') badgeClass = 'badge-feature';
                    else if (item.type === 'Issue') badgeClass = 'badge-issue';
                    else if (item.type === 'Announcement') badgeClass = 'badge-announcement';
                    
                    card.innerHTML = `
                        <div class="update-card-header">
                            <div class="card-badge-container">
                                <span class="badge ${badgeClass}">${item.type}</span>
                                <span class="card-date">${entry.date}</span>
                            </div>
                            <span class="card-select-hint">
                                <i class="fa-solid ${isSelected ? 'fa-square-check' : 'fa-circle-plus'}"></i> 
                                ${isSelected ? 'Selected' : 'Select to Tweet'}
                            </span>
                        </div>
                        <div class="update-card-body">
                            ${item.body}
                        </div>
                    `;
                    
                    // Card Selection Event
                    card.addEventListener('click', (e) => {
                        // Avoid trigger selection on clicking inside links
                        if (e.target.tagName.toLowerCase() === 'a') return;
                        
                        selectCard(entry, item, index, card);
                    });
                    
                    dayCards.appendChild(card);
                });
                
                dayGroup.appendChild(dayCards);
                feedContainer.appendChild(dayGroup);
            }
        });

        if (!hasContent) {
            renderEmptyState();
        }
    }

    // Render Empty Search / Filter state
    function renderEmptyState() {
        feedContainer.innerHTML = `
            <div class="empty-state">
                <i class="fa-regular fa-folder-open empty-icon"></i>
                <h3>No Matching Updates Found</h3>
                <p>Try refining your search text or switching filter tags.</p>
            </div>
        `;
    }

    // Select/Deselect a card item
    function selectCard(entry, item, index, cardElement) {
        const isAlreadySelected = selectedUpdate && 
            selectedUpdate.id === entry.id && 
            selectedUpdate.index === index;

        // Reset all selected cards visually
        document.querySelectorAll('.update-card').forEach(card => {
            card.classList.remove('selected');
            const hint = card.querySelector('.card-select-hint');
            if (hint) {
                hint.innerHTML = '<i class="fa-solid fa-circle-plus"></i> Select to Tweet';
            }
        });

        if (isAlreadySelected) {
            // Deselect
            selectedUpdate = null;
            composerTip.classList.remove('hidden');
            composerContent.classList.add('hidden');
        } else {
            // Select new card
            selectedUpdate = {
                id: entry.id,
                index: index,
                date: entry.date,
                link: entry.link,
                item: item
            };
            
            cardElement.classList.add('selected');
            const hint = cardElement.querySelector('.card-select-hint');
            if (hint) {
                hint.innerHTML = '<i class="fa-solid fa-square-check"></i> Selected';
            }
            
            // Populate tweet composer
            autoComposeTweet(selectedUpdate);
            composerTip.classList.add('hidden');
            composerContent.classList.remove('hidden');
            
            // Focus textarea
            tweetTextarea.focus();
        }
    }

    // Clear current selection
    function clearSelection() {
        selectedUpdate = null;
        document.querySelectorAll('.update-card').forEach(card => {
            card.classList.remove('selected');
            const hint = card.querySelector('.card-select-hint');
            if (hint) {
                hint.innerHTML = '<i class="fa-solid fa-circle-plus"></i> Select to Tweet';
            }
        });
        composerTip.classList.remove('hidden');
        composerContent.classList.add('hidden');
    }

    // Auto-generate professional Tweet copy
    function autoComposeTweet(updateInfo) {
        const { date, link, item } = updateInfo;
        
        // Clean and prepare the type badge tag
        const tag = item.type.toUpperCase();
        
        // Build base strings
        const header = `🆕 #BigQuery ${tag} (${date}):\n\n`;
        const footer = `\n\nMore info: ${link}`;
        
        // Safe character calculations
        // Twitter counts URLs as 23 characters
        const urlLength = 23;
        const totalTemplateLength = header.length + "\n\nMore info: ".length + urlLength;
        const maxTextLength = 280 - totalTemplateLength - 10; // extra padding
        
        let bodyText = item.text;
        if (bodyText.length > maxTextLength) {
            bodyText = bodyText.substring(0, maxTextLength - 3) + '...';
        }
        
        const fullTweetText = `${header}${bodyText}${footer}`;
        
        tweetTextarea.value = fullTweetText;
        updateCharCount();
    }

    // Update Tweet character counter and styles
    function updateCharCount() {
        const len = tweetTextarea.value.length;
        charCounter.textContent = `${len} / 280`;
        
        // Color classes depending on count
        charCounter.className = 'char-counter';
        if (len > 280) {
            charCounter.classList.add('danger');
            tweetBtn.disabled = true;
        } else if (len >= 250) {
            charCounter.classList.add('warning');
            tweetBtn.disabled = false;
        } else {
            tweetBtn.disabled = false;
        }
    }

    // Search and Filter Events
    searchInput.addEventListener('input', (e) => {
        currentSearchQuery = e.target.value;
        renderFeed();
    });

    filterButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            filterButtons.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            currentFilterType = btn.getAttribute('data-type');
            renderFeed();
        });
    });

    // Textarea manual edits
    tweetTextarea.addEventListener('input', updateCharCount);

    // Tweet Share Action
    tweetBtn.addEventListener('click', () => {
        const text = tweetTextarea.value;
        const twitterUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(text)}`;
        window.open(twitterUrl, '_blank', 'noopener,noreferrer');
    });

    // Clear button action
    clearSelectBtn.addEventListener('click', clearSelection);

    // Refresh Events
    refreshBtn.addEventListener('click', fetchReleaseNotes);
    retryBtn.addEventListener('click', fetchReleaseNotes);

    // Initial load
    fetchReleaseNotes();
});
