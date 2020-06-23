Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A232206124
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2020 23:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79966E7F1;
	Tue, 23 Jun 2020 21:02:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8BB6E198
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2020 20:39:01 +0000 (UTC)
Received: from kirika.xs4all.nl ([IPv6:2001:985:5198:1:dced:2021:4507:6be6])
 by smtp-cloud9.xs4all.net with ESMTP
 id nph5jiOnJvh6gnph6j382J; Tue, 23 Jun 2020 22:39:00 +0200
Received: from localhost (localhost [IPv6:::1])
 by kirika.xs4all.nl (Postfix) with ESMTPS id E3E7A1A401B0
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2020 22:38:58 +0200 (CEST)
Date: Tue, 23 Jun 2020 22:38:58 +0200 (CEST)
From: John van der Kamp <sjonny@suffe.me.uk>
X-X-Sender: sjonny@kirika.lan
To: amd-gfx@lists.freedesktop.org
Subject: Mutex stays locked on error
Message-ID: <alpine.DEB.2.21.2006232235050.3391@kirika.lan>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCrp4fQReB9IVo5JSurzUwVNocwpq78FfeF7O0ap0lg85p8aZAtvqf1f51lLrpVmxQTATV9bO3oppAp5Wo9vyePjrFEvoMRxwHSGiGRbqyjrz8jvz0+w
 uBrplg/V6Br4W7DZtrfskdD0/aH/pIiqiSyD0z+dqIoFoCJzGK+0y8lXYeKoUADjYk+lJnv7LI6VGMx7HtDNgqnfcEP0M/CPOJk0cmM7Eb3LUSCqgYQs1uFa
 oGI5QlsJg4xfdKT36vmrSQ==
X-Mailman-Approved-At: Tue, 23 Jun 2020 21:02:05 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Try to mail the patch again, this time inline. Hope this is how you can 
process it.

John

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index dcf84a61de37..949d10ef8304 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -510,8 +510,10 @@ static ssize_t srm_data_read(struct file *filp, struct kobject *kobj, struct bin
 
 	srm = psp_get_srm(work->hdcp.config.psp.handle, &srm_version, &srm_size);
 
-	if (!srm)
-		return -EINVAL;
+	if (!srm) {
+		ret = -EINVAL;
+		goto ret;
+	}
 
 	if (pos >= srm_size)
 		ret = 0;
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
