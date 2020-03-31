Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E019A04D
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Mar 2020 22:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D066E88F;
	Tue, 31 Mar 2020 20:58:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B5D6E88E
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 Mar 2020 20:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585688277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qXwJ6P01usnj3n8GpAUGcfZ6SN4qPkwbrrUG0deRB5k=;
 b=de1IvRR10eGiF76d+iWOMQJczhgjzgngPJj2g7vv2UafW7LmgKDIx1QbAAlHJZQ1T7WXWd
 P2IXyAUOk/GGQOQngv0T6X219MZEZS9yIStNjny71m5oUN3liP7jZxjUkPN2TCXLYGJTma
 q+Yui/8hN68f7EYXwIJjKZ7sbRA2auA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-Dif1_LD1PJSp7HZe4pV2Ng-1; Tue, 31 Mar 2020 16:57:49 -0400
X-MC-Unique: Dif1_LD1PJSp7HZe4pV2Ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D22468018D1;
 Tue, 31 Mar 2020 20:57:46 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-113-88.rdu2.redhat.com [10.10.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B05D97B19;
 Tue, 31 Mar 2020 20:57:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/dp_mst: Remove ->destroy_connector() callback
Date: Tue, 31 Mar 2020 16:57:33 -0400
Message-Id: <20200331205740.135525-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: "David \(ChunMing\) Zhou" <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Francis <david.francis@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This finishes up the work that Pankaj Bharadiya started in:

https://patchwork.freedesktop.org/series/74412/

And allows us to entirely remove ->destroy_connector()

Lyude Paul (4):
  drm/amd/amdgpu_dm/mst: Remove unneeded edid assignment when destroying
    connectors
  drm/amd/amdgpu_dm/mst: Remove ->destroy_connector() callback
  drm/amd/amdgpu_dm/mst: Stop printing extra messages in
    dm_dp_add_mst_connector()
  drm/dp_mst: Remove drm_dp_mst_topology_cbs.destroy_connector

 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 45 +++++--------------
 drivers/gpu/drm/drm_dp_mst_topology.c         | 16 ++-----
 include/drm/drm_dp_mst_helper.h               |  2 -
 3 files changed, 15 insertions(+), 48 deletions(-)

-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
