Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26982315CD8
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Feb 2021 03:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994C96E157;
	Wed, 10 Feb 2021 02:06:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E796A6E120;
 Tue,  9 Feb 2021 23:48:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id v24so147198lfr.7;
 Tue, 09 Feb 2021 15:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JxrYmkpfatu4jodGQPHh0hSLDnzosVKpfQHIfMv8e0E=;
 b=a4+ooLUJ9FAgYmcQzjbHCIpUbILnxr0074Y7TTtS1niQ+OXcKKkFAsRlv+n9w0AUkQ
 xe96JuBYSxsjSoG5BEljDZyWPe1gwovgctMxvYmdE28Hwp0sPHLsdXyJAcU0QXtaq3Ym
 uomHIr1XdDf5At6EGGhv4uoX0JQzFyecpIm3b3bL8wtD6MJWLHMk+1zDoPzD0movYJI9
 0GR6a1OloL8GztF3h+lPLankIHYuKJ5VHAXf7Zgxvts4XKr12RjOSufxZFB1okHKMjvZ
 YF849P6oN+vcI0XgnW7eDgoU+xBS7BKdxksYrCMY6hMD9ceCGu4QEbA3zxL5iShcqypd
 hkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JxrYmkpfatu4jodGQPHh0hSLDnzosVKpfQHIfMv8e0E=;
 b=BKGcHJc/HbfqznNqSR+JUC5sKFs80OHHX5ZlAgqv9CpEvRDgH4Wkbv0m/3w5MkjcOe
 t1Fk1XFQUVPHyox5gK6kOaN4D0i1FRGrK+wxypMPv4o+myk8J3YjsN5tJDmo1hPrZR67
 n1H5R2yctfh7UIdoSwfv+GTZYf6R034v/7GTxTNVH4VPtWlEJ7imnUy/NFbkqMxeeFsa
 QgxEd0TcQttYaLv7kMzcMkyYW/ZdMi40ruJEsBB8UuWsyd9UQAkJVOFcatcD0X4XNq19
 Aw6GAHh5Kn1hOERAFsjJsJiLD0r0erOnZMccpqwakAG6RaVLEzUm97E50N+TjJ2tNXgo
 6d1w==
X-Gm-Message-State: AOAM530bfdgZ564Y4uMO4Xu3+T2wrolUAkugnYXlOn40iWLL0Wd7fzvV
 t2dgArMZnVcXX7pZaV/CSiI=
X-Google-Smtp-Source: ABdhPJwqKSKzlI6Nl6bidLwNbX9MfrP2AS8P6ODueDZoOP887CZ/ogaO4H8idiomt1SKtPzz3UjJIA==
X-Received: by 2002:ac2:44c3:: with SMTP id d3mr189106lfm.375.1612914503392;
 Tue, 09 Feb 2021 15:48:23 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se.
 [158.174.22.164])
 by smtp.gmail.com with ESMTPSA id c25sm23779lja.131.2021.02.09.15.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 15:48:22 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm/ttm: constify static vm_operations_structs
Date: Wed, 10 Feb 2021 00:48:14 +0100
Message-Id: <20210209234817.55112-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Feb 2021 02:06:04 +0000
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
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Likun Gao <Likun.Gao@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Constify a few static vm_operations_struct that are never modified. Their
only usage is to assign their address to the vm_ops field in the
vm_area_struct, which is a pointer to const vm_operations_struct. Make them
const to allow the compiler to put them in read-only memory.

With this series applied, all static struct vm_operations_struct in the
kernel tree are const.

Rikard Falkeborn (3):
  drm/amdgpu/ttm: constify static vm_operations_struct
  drm/radeon/ttm: constify static vm_operations_struct
  drm/nouveau/ttm: constify static vm_operations_struct

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c   | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.30.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
