Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6955537B81
	for <lists+amd-gfx@lfdr.de>; Mon, 30 May 2022 15:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C080E10E86C;
	Mon, 30 May 2022 13:26:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9250810E864;
 Mon, 30 May 2022 13:26:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D810B80D84;
 Mon, 30 May 2022 13:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA69C36AE5;
 Mon, 30 May 2022 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917168;
 bh=Sn2E5T7+eZANOZsUBkk4ShXP8E0TUT3ruFCM8ktCFR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jyqlpUvWIY/6L3wPyNvrjbu8mOemE/87kZk92zBp9fp5SEA8DqyFd34yRB3khy/Ka
 svfWCuAPQFB0Bre/HcBKNtr4nssJCNP7FhL4GO0PwMYeyx5YkU/MD/0rQLNjirwdCR
 NrofaYeqqi6wg7yBCWRVWLy2eXRLFdw3JC9P33BfABEf4Pm2CVE6ALRFSCAj1MFVBD
 XMU1ZIdNII4zz/ruMWwmUqeWtEmexiXI44QArxV2sjP775TUK0ZnaKKPdySxlRRSbV
 pgEZ+kzs2/2gEDkGerBYPq07Tq+SoVL7quWmIQIQbcnAN5VNo8MXzKnfIm8ZAWbSRF
 94virnZgE2ktQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 043/159] drm/amd/pm: fix double free in
 si_parse_power_table()
Date: Mon, 30 May 2022 09:22:28 -0400
Message-Id: <20220530132425.1929512-43-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, jiapeng.chong@linux.alibaba.com,
 lijo.lazar@amd.com, airlied@linux.ie, maira.canal@usp.br, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com, Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>,
 Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>

[ Upstream commit f3fa2becf2fc25b6ac7cf8d8b1a2e4a86b3b72bd ]

In function si_parse_power_table(), array adev->pm.dpm.ps and its member
is allocated. If the allocation of each member fails, the array itself
is freed and returned with an error code. However, the array is later
freed again in si_dpm_fini() function which is called when the function
returns an error.

This leads to potential double free of the array adev->pm.dpm.ps, as
well as leak of its array members, since the members are not freed in
the allocation function and the array is not nulled when freed.
In addition adev->pm.dpm.num_ps, which keeps track of the allocated
array member, is not updated until the member allocation is
successfully finished, this could also lead to either use after free,
or uninitialized variable access in si_dpm_fini().

Fix this by postponing the free of the array until si_dpm_fini() and
increment adev->pm.dpm.num_ps everytime the array member is allocated.

Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 633dab14f51c..49c398ec0aaf 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7297,17 +7297,15 @@ static int si_parse_power_table(struct amdgpu_device *adev)
 	if (!adev->pm.dpm.ps)
 		return -ENOMEM;
 	power_state_offset = (u8 *)state_array->states;
-	for (i = 0; i < state_array->ucNumEntries; i++) {
+	for (adev->pm.dpm.num_ps = 0, i = 0; i < state_array->ucNumEntries; i++) {
 		u8 *idx;
 		power_state = (union pplib_power_state *)power_state_offset;
 		non_clock_array_index = power_state->v2.nonClockInfoIndex;
 		non_clock_info = (struct _ATOM_PPLIB_NONCLOCK_INFO *)
 			&non_clock_info_array->nonClockInfo[non_clock_array_index];
 		ps = kzalloc(sizeof(struct  si_ps), GFP_KERNEL);
-		if (ps == NULL) {
-			kfree(adev->pm.dpm.ps);
+		if (ps == NULL)
 			return -ENOMEM;
-		}
 		adev->pm.dpm.ps[i].ps_priv = ps;
 		si_parse_pplib_non_clock_info(adev, &adev->pm.dpm.ps[i],
 					      non_clock_info,
@@ -7329,8 +7327,8 @@ static int si_parse_power_table(struct amdgpu_device *adev)
 			k++;
 		}
 		power_state_offset += 2 + power_state->v2.ucNumDPMLevels;
+		adev->pm.dpm.num_ps++;
 	}
-	adev->pm.dpm.num_ps = state_array->ucNumEntries;
 
 	/* fill in the vce power states */
 	for (i = 0; i < adev->pm.dpm.num_of_vce_states; i++) {
-- 
2.35.1

