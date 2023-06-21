Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0FB7389B8
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Jun 2023 17:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CED10E4B8;
	Wed, 21 Jun 2023 15:38:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 373 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jun 2023 12:04:48 UTC
Received: from tretyak2.mcst.ru (tretyak2.mcst.ru [212.5.119.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A7610E468;
 Wed, 21 Jun 2023 12:04:47 +0000 (UTC)
Received: from tretyak2.mcst.ru (localhost [127.0.0.1])
 by tretyak2.mcst.ru (Postfix) with ESMTP id DE46410239C;
 Wed, 21 Jun 2023 14:58:29 +0300 (MSK)
Received: from frog.lab.sun.mcst.ru (frog.lab.sun.mcst.ru [176.16.4.50])
 by tretyak2.mcst.ru (Postfix) with ESMTP id D7DFF102390;
 Wed, 21 Jun 2023 14:57:44 +0300 (MSK)
Received: from artemiev-i.lab.sun.mcst.ru (avior-1 [192.168.53.223])
 by frog.lab.sun.mcst.ru (8.13.4/8.12.11) with ESMTP id 35LBvhXh010817;
 Wed, 21 Jun 2023 14:57:44 +0300
From: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [lvc-project] [PATCH] drm/radeon: remove useless conditions
Date: Wed, 21 Jun 2023 14:56:17 +0300
Message-Id: <20230621115617.2126804-1-Igor.A.Artemiev@mcst.ru>
X-Mailer: git-send-email 2.39.0.152.ga5737674b6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Anti-Virus: Kaspersky Anti-Virus for Linux Mail Server 5.6.39/RELEASE,
 bases: 20111107 #2745587, check: 20230621 notchecked
X-AV-Checked: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 21 Jun 2023 15:38:41 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: lvc-project@linuxtesting.org, Igor Artemiev <Igor.A.Artemiev@mcst.ru>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Comparisons of 'table' and 'vddc_sclk_table' with NULL are useless
since 'table' and 'vddc_sclk_table' are initialized by an addresses
and cannot be NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
---
 drivers/gpu/drm/radeon/kv_dpm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_dpm.c
index f7735da07feb..17d312ceb6ec 100644
--- a/drivers/gpu/drm/radeon/kv_dpm.c
+++ b/drivers/gpu/drm/radeon/kv_dpm.c
@@ -399,7 +399,7 @@ static u32 kv_convert_vid2_to_vid7(struct radeon_device *rdev,
 		&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk;
 	u32 i;
 
-	if (vddc_sclk_table && vddc_sclk_table->count) {
+	if (vddc_sclk_table->count) {
 		if (vid_2bit < vddc_sclk_table->count)
 			return vddc_sclk_table->entries[vid_2bit].v;
 		else
@@ -421,7 +421,7 @@ static u32 kv_convert_vid7_to_vid2(struct radeon_device *rdev,
 		&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk;
 	u32 i;
 
-	if (vddc_sclk_table && vddc_sclk_table->count) {
+	if (vddc_sclk_table->count) {
 		for (i = 0; i < vddc_sclk_table->count; i++) {
 			if (vddc_sclk_table->entries[i].v == vid_7bit)
 				return i;
@@ -561,7 +561,7 @@ static int kv_program_bootup_state(struct radeon_device *rdev)
 	struct radeon_clock_voltage_dependency_table *table =
 		&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk;
 
-	if (table && table->count) {
+	if (table->count) {
 		for (i = pi->graphics_dpm_level_count - 1; i > 0; i--) {
 			if (table->entries[i].clk == pi->boot_pl.sclk)
 				break;
@@ -666,7 +666,7 @@ static int kv_populate_uvd_table(struct radeon_device *rdev)
 	int ret;
 	u32 i;
 
-	if (table == NULL || table->count == 0)
+	if (table->count == 0)
 		return 0;
 
 	pi->uvd_level_count = 0;
@@ -737,7 +737,7 @@ static int kv_populate_vce_table(struct radeon_device *rdev)
 		&rdev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table;
 	struct atom_clock_dividers dividers;
 
-	if (table == NULL || table->count == 0)
+	if (table->count == 0)
 		return 0;
 
 	pi->vce_level_count = 0;
@@ -800,7 +800,7 @@ static int kv_populate_samu_table(struct radeon_device *rdev)
 	int ret;
 	u32 i;
 
-	if (table == NULL || table->count == 0)
+	if (table->count == 0)
 		return 0;
 
 	pi->samu_level_count = 0;
@@ -866,7 +866,7 @@ static int kv_populate_acp_table(struct radeon_device *rdev)
 	int ret;
 	u32 i;
 
-	if (table == NULL || table->count == 0)
+	if (table->count == 0)
 		return 0;
 
 	pi->acp_level_count = 0;
@@ -922,7 +922,7 @@ static void kv_calculate_dfs_bypass_settings(struct radeon_device *rdev)
 	struct radeon_clock_voltage_dependency_table *table =
 		&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk;
 
-	if (table && table->count) {
+	if (table->count) {
 		for (i = 0; i < pi->graphics_dpm_level_count; i++) {
 			if (pi->caps_enable_dfs_bypass) {
 				if (kv_get_clock_difference(table->entries[i].clk, 40000) < 200)
@@ -1532,7 +1532,7 @@ static void kv_set_valid_clock_range(struct radeon_device *rdev,
 	struct radeon_clock_voltage_dependency_table *table =
 		&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk;
 
-	if (table && table->count) {
+	if (table->count) {
 		for (i = 0; i < pi->graphics_dpm_level_count; i++) {
 			if ((table->entries[i].clk >= new_ps->levels[0].sclk) ||
 			    (i == (pi->graphics_dpm_level_count - 1))) {
@@ -1905,7 +1905,7 @@ static int kv_get_high_voltage_limit(struct radeon_device *rdev, int *limit)
 		&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk;
 	int i;
 
-	if (table && table->count) {
+	if (table->count) {
 		for (i = table->count - 1; i >= 0; i--) {
 			if (pi->high_voltage_t &&
 			    (kv_convert_8bit_index_to_voltage(rdev, table->entries[i].v) <=
@@ -2149,7 +2149,7 @@ static void kv_init_graphics_levels(struct radeon_device *rdev)
 	struct radeon_clock_voltage_dependency_table *table =
 		&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk;
 
-	if (table && table->count) {
+	if (table->count) {
 		u32 vid_2bit;
 
 		pi->graphics_dpm_level_count = 0;
-- 
2.30.2

