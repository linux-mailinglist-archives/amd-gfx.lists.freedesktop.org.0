Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7A32B304
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Mar 2021 04:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3D06E423;
	Wed,  3 Mar 2021 03:49:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D36D6E423
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Mar 2021 03:49:38 +0000 (UTC)
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id AE3A51A92;
 Wed,  3 Mar 2021 11:49:35 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from chenli.uniontech.com (unknown [58.246.122.242])
 by smtp.263.net (postfix) whith ESMTP id
 P32470T140679082661632S1614743375459675_; 
 Wed, 03 Mar 2021 11:49:36 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e97faf1cb6adc5637f4efa2d2d0628d3>
X-RL-SENDER: chenli@uniontech.com
X-SENDER: chenli@uniontech.com
X-LOGIN-NAME: chenli@uniontech.com
X-FST-TO: amd-gfx@lists.freedesktop.org
X-SENDER-IP: 58.246.122.242
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Date: Wed, 03 Mar 2021 11:49:34 +0800
Message-ID: <87v9a8lwvl.wl-chenli@uniontech.com>
From: Chen Li <chenli@uniontech.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/3] Use kvmalloc_array for radeon and amdgpu CS chunks
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/27.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-Mailman-Approved-At: Wed, 03 Mar 2021 03:49:53 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-1?Q?=22Christian_K=F6nig=22?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


When testing kernel with trinity, the kernel turned to tainted in that radeon CS require large memory and order is over MAX_ORDER.

kvmalloc/kvmalloc_array should be used here in that it will fallback to vmalloc if necessary.

Chen Li (3):
  drm/radeon: Use kvmalloc for CS chunks
  drm/amdgpu: Use kvmalloc for CS chunks
  drm/amdgpu: correct DRM_ERROR for kvmalloc_array

Changelog:
  v1->v2:
    * also use kvmalloc in amdgpu
    * fix a DRM_ERROR message for kvmalloc_array.
  v2->v3:
    * add missing kvfree for amdgpu CS

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 14 +++++++-------
 drivers/gpu/drm/radeon/radeon_cs.c     |  8 ++++----
 2 files changed, 11 insertions(+), 11 deletions(-)

--
2.30.0


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
