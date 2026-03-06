Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAIxGBmLqml0TQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 06 Mar 2026 09:06:49 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA921CD52
	for <lists+amd-gfx@lfdr.de>; Fri, 06 Mar 2026 09:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC3F10E3AB;
	Fri,  6 Mar 2026 08:06:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABBA10E3AB
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Mar 2026 08:06:46 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 62686gwb1810346; Fri, 6 Mar 2026 13:36:42 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 62686gmn1810345;
 Fri, 6 Mar 2026 13:36:42 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>,
 Philip Yang <philip.yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>
Subject: [PATCH v1 1/2] drm/amdkd: fix the warning for potential insecure
 string
Date: Fri,  6 Mar 2026 13:36:35 +0530
Message-Id: <20260306080636.1810291-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: EFFA921CD52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:sunil.khatri@amd.com,m:philip.yang@amd.com,m:felix.kuehling@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email]
X-Rspamd-Action: no action

Below is the warning thrown by the clang compiler:
linux/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:588:9: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
                                           stats_dir_filename);
                                           ^~~~~~~~~~~~~~~~~~
linux/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:588:9: note: treat the string as an argument to avoid this
                                           stats_dir_filename);
                                           ^
                                           "%s",
linux/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:635:18: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
                                           p->kobj, counters_dir_filename);
                                                    ^~~~~~~~~~~~~~~~~~~~~
linux/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:635:18: note: treat the string as an argument to avoid this
                                           p->kobj, counters_dir_filename);
                                                    ^
                                                    "%s",

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
CC: Philip Yang <philip.yang@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0b3b0c26e05c..d202827df66e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -585,7 +585,7 @@ static void kfd_procfs_add_sysfs_stats(struct kfd_process *p)
 		ret = kobject_init_and_add(pdd->kobj_stats,
 					   &procfs_stats_type,
 					   p->kobj,
-					   stats_dir_filename);
+					   "%s", stats_dir_filename);
 
 		if (ret) {
 			pr_warn("Creating KFD proc/stats_%s folder failed",
@@ -632,7 +632,7 @@ static void kfd_procfs_add_sysfs_counters(struct kfd_process *p)
 			return;
 
 		ret = kobject_init_and_add(kobj_counters, &sysfs_counters_type,
-					   p->kobj, counters_dir_filename);
+					   p->kobj, "%s", counters_dir_filename);
 		if (ret) {
 			pr_warn("Creating KFD proc/%s folder failed",
 				counters_dir_filename);
-- 
2.34.1

