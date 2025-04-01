// Initialize Lucide icons
document.addEventListener('DOMContentLoaded', () => {
    lucide.createIcons();

    // Mobile menu toggle
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');

    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    }

    // Generate contribution graph
    generateContributionGraph();
});

// Function to generate a random contribution graph
function generateContributionGraph() {
    const contributionGraph = document.querySelector('.contribution-graph');
    if (!contributionGraph) return;

    // Clear existing content
    contributionGraph.innerHTML = '';

    // Generate cells for 52 weeks x 7 days
    for (let w = 0; w < 52; w++) {
        const weekColumn = document.createElement('div');
        weekColumn.className = 'flex flex-col';

        for (let d = 0; d < 7; d++) {
            // Random contribution level (0-4)
            const level = Math.floor(Math.random() * 5);
            const date = new Date(2023, 0, w * 7 + d + 1);

            // Get color based on contribution level
            let color;
            switch (level) {
                case 0: color = '#161b22'; break;
                case 1: color = '#0e4429'; break;
                case 2: color = '#006d32'; break;
                case 3: color = '#26a641'; break;
                case 4: color = '#39d353'; break;
            }

            const cell = document.createElement('div');
            cell.className = 'contribution-cell';
            cell.style.backgroundColor = color;
            cell.title = `${level} contributions on ${date.toDateString()}`;
            weekColumn.appendChild(cell);
        }

        contributionGraph.appendChild(weekColumn);
    }
}
