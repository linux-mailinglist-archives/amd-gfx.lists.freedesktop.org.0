Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EFA36FC
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 14:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7B16E31D;
	Fri, 30 Aug 2019 12:43:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2019 04:41:37 UTC
Received: from mx5.ucr.edu (mx5.ucr.edu [138.23.62.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8CD6E226
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 04:41:37 +0000 (UTC)
IronPort-SDR: g+4BYWkHVzB46DUTtuays5JzRf2fOs3scCfDZ90pBQ6drCuHsEx4R7AjnTAn41IRuLwkaJm0cn
 Qqgbvuiwnhd8hiYgRbaJy2snatq0yhVUvRbpfpIZUygz7t0lIADd5nx77HStliQyCqVnQMHHWc
 zGg+R5o5lPKrK5skoEtWFVccL46jBbK7qYRL4rJW738DJ7rPHX1vjMI2Ymg6lty6RwDdAzg3VX
 lttPn1BPJTFbF7zwmTf7PxYsEZBWMtbBW5UahsLSfY5xn7jykXUOjbVegYidL93nEzAYwDILWm
 LjU=
IronPort-PHdr: =?us-ascii?q?9a23=3AlUWkaRB6KJHnZH6G/qnpUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSPvyocbcNUDSrc9gkEXOFd2Cra4d0ayP7furCTVIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfK1+IA+roQjQuMQajohvJrsswR?=
 =?us-ascii?q?bVv3VEfPhby3l1LlyJhRb84cmw/J9n8ytOvv8q6tBNX6bncakmVLJUFDspPX?=
 =?us-ascii?q?w7683trhnDUBCA5mAAXWUMkxpHGBbK4RfnVZrsqCT6t+592C6HPc3qSL0/RD?=
 =?us-ascii?q?qv47t3RBLulSwKLCAy/n3JhcNsjaJbuBOhqAJ5w47Ie4GeKf5ycrrAcd8GWW?=
 =?us-ascii?q?ZNW8BcVylAAoOndIsPDuwBPelFpIfjvlUFsBW+BQiyC+Pr1zBDm3v60KMm3+?=
 =?us-ascii?q?gkFwzNwQ4uEM8UsHnMrNv7KrocX+62wqfP1jjPc+9a1C3h5IXSbhwtvfeBVq?=
 =?us-ascii?q?9wf8rLzkkvEhvIgVeRqY3kPzOVy+MNuHWc4utgVOOvi3QoqwBtrjSzyMohkZ?=
 =?us-ascii?q?TJiZ4Pylze6yp23Zs1KMS+RUVmYtCkCINduz+GO4ZyWM8vQGFltDwkxrEbtp?=
 =?us-ascii?q?O3ZjUGxZAlyhLHdvCKcoyF7gj9WOufITp0nmxpdbOlixuw/kWtzPD3WNOu31?=
 =?us-ascii?q?ZQtCVFl8HBtnUK1xPO9MeKUuB9/kK92TaX0ADT9/1ELVg0laXFL54hxaY9lp?=
 =?us-ascii?q?8JvkTCGi/6gV32jKuLekk99Oik9uDqb7f8qp+TMI90jQ7+MqAwlcClHes4NQ?=
 =?us-ascii?q?0OU3Ca+eS6yrLj4VX0TKtWgvAyiKXUs5DXKd4FqqKkDAJZyJsv5hK9Aju+1d?=
 =?us-ascii?q?QXh3gHLFZLeBKdiIjpPknDIfD5DPe/mVuskStny+zIM7D6H5XCMmLDnK3/cr?=
 =?us-ascii?q?lg9k5Q0BAzwsxH55JIFrEBJ+r+VVX0tNPFFxM5PAK0wun8BdV514MeQn6PAr?=
 =?us-ascii?q?SDPKPcq1+H+PwgLPSSa48Ouzb9N/8l5+b0gX8+g18dcvrh84EQbSWJH+ZmPk?=
 =?us-ascii?q?LRNWv+gt4AST9Rlhc1VqrnhEDUAm0bXGq7Q69pvmJzM4mhF4qWA9/1jQ=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FuAAB5pmhdhsXWVdFmHgEGBwaBUwk?=
 =?us-ascii?q?LAYNXTBCNHYZfAQaLHxhxhXmILYF7AQgBAQEMAQEtAgEBhD+CXCM0CQ4CAwg?=
 =?us-ascii?q?BAQUBAQEBAQYEAQECEAEBAQgLCwgphUGCOimCYAsWFVKBFQEFATUiOYJHAYF?=
 =?us-ascii?q?2FAWfdIEDPIwjM4hkAQgMgUkJAQiBIgGHHYRZgRCBB4ERgmRsh2OCRASBLgE?=
 =?us-ascii?q?BAZRQlgYBBgIBggwUgXKSVSeEMIkZixMBpiYCCgcGDyGBL4IRTSWBbAqBRIJ?=
 =?us-ascii?q?cjksfM4EIjiAB?=
X-IPAS-Result: =?us-ascii?q?A2FuAAB5pmhdhsXWVdFmHgEGBwaBUwkLAYNXTBCNHYZfA?=
 =?us-ascii?q?QaLHxhxhXmILYF7AQgBAQEMAQEtAgEBhD+CXCM0CQ4CAwgBAQUBAQEBAQYEA?=
 =?us-ascii?q?QECEAEBAQgLCwgphUGCOimCYAsWFVKBFQEFATUiOYJHAYF2FAWfdIEDPIwjM?=
 =?us-ascii?q?4hkAQgMgUkJAQiBIgGHHYRZgRCBB4ERgmRsh2OCRASBLgEBAZRQlgYBBgIBg?=
 =?us-ascii?q?gwUgXKSVSeEMIkZixMBpiYCCgcGDyGBL4IRTSWBbAqBRIJcjksfM4EIjiAB?=
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="73781423"
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 21:34:31 -0700
Received: by mail-pl1-f197.google.com with SMTP id v4so3325249plp.23
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 21:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=07dOxqCdQxKDoU2+68GM0KeX5KWpD+AWua+kX8OJRIA=;
 b=R3gmhSgYkiraCPT5xTwXx+EmhPHMAnt9i3qQwjw2oJ2YVfsQQefjkv5bCmWuCYEcSK
 lXRJ5FfYX31hmLSSh9iNcW1Q4pARH1DGk0Wby+7bqk2xlRmDbc7TF0SHz1cm8LNPxAix
 PCzzmKPHH9F5QFl48BCkAzi1QZAfkLkLFiUMEK2Hg+LsYg4p9CeANlz+wXpfVjAADTpt
 z83OAfeJ/ZtReswe+TtMSpp9CTgXYQANaeyTxbljISRCwig806AxRsENRzO6stjHvgjQ
 j435eZpk0TayY9tPgiVo8MekX+P6rtxbbqX+nHt7ijGv9AUgjmlArPv1znVFDEDFXpwj
 ABAg==
X-Gm-Message-State: APjAAAVS6ilbzem212sfMnkBFCFuJUFA4FGa9evut+cc1hDY7r9MS4Xx
 25I1xR+oljVn5V1CYU1qV4+ITqyfJc8S0PQ62sC2OgKpnh+4+MkloJvRMdZojUnBI92TSPno4WR
 /aO7EomlcYqdJsem/Sg5+ed8Rs8Q=
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr13607513pln.37.1567139670466; 
 Thu, 29 Aug 2019 21:34:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyvmLToVZOecb3FxtZYyGbzvjpkmy+blWZgKh+cvqVJJgCWAhy1BthWVCA7K/ffjCHY7QWwA==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr13607482pln.37.1567139670076; 
 Thu, 29 Aug 2019 21:34:30 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
 by smtp.googlemail.com with ESMTPSA id 6sm5204331pfa.7.2019.08.29.21.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 21:34:29 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Subject: [PATCH] drm/amd/powerplay: Variable ps could be NULL when it get
 dereferenced
Date: Thu, 29 Aug 2019 21:35:04 -0700
Message-Id: <20190830043504.23760-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 30 Aug 2019 12:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1567140098; x=1598676098;
 h=from:to:cc:subject:date:message-id;
 bh=XPfJegQ++l69vVm04ifZLNdv62gocxHQ8bqgeCGaYj0=;
 b=qIfLEDhVusfCPWCcljhXMnuXDB/DLFt2I5zWkwLihhuRySqlPAmBY4eB
 udTSfOp3i1cm7iSBu1+1miy6fAFpUQDApIG2FpPiLdAzOmuqhEt1JT8Sr
 fdQ9UyiBplngyprOMJicHY6z4Dt8LdiAk1AJIJNxSkltSUOf7Fu2vl05t
 Y8bdV57z+VlobOA4TzMJWQkqUpc3acydbQHIORNpuz8RhTviVLkj4TvnN
 ZZ2HgfAYILn0FXZ52PQ3qgeu5q0YNwNdRZYtQxc/tvD/tSErtL7ak3Qo7
 viG/RmFPRicD96uQyOV6tKWA8bMLAeBy6wrDg/fItK3weJfVQT4Zbz3x1
 w==;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: csong@cs.ucr.edu, David Airlie <airlied@linux.ie>, zhiyunq@cs.ucr.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Yizhuo <yzhai003@ucr.edu>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5zaWRlIGZ1bmN0aW9uIGN6X2dldF9wZXJmb3JtYW5jZV9sZXZlbCgpLCBwb2ludGVyIHBzIGNv
dWxkIGJlIE5VTEwgdmlhCmNhc3RfY29uc3RfUGh3Q3pQb3dlclN0YXRlKCkuIEhvd2V2ZXIsIHRo
aXMgcG9pbnRlciBpcyBkZXJlZmVyZW5jZWQKd2l0aG91dCBhbnkgY2hlY2ssIHdoaWNoIGlzIHBv
dGVudGlhbGx5IHVuc2FmZS4KClNpZ25lZC1vZmYtYnk6IFlpemh1byA8eXpoYWkwMDNAdWNyLmVk
dT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9jel9od21nci5jIHwg
MyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9jel9od21nci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvY3pfaHdtZ3IuYwppbmRleCBiYzgzOWZmMGJkZDAuLmQy
NjI4ZTdiNjEyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3IvY3pfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9j
el9od21nci5jCkBAIC0xNzk5LDYgKzE3OTksOSBAQCBzdGF0aWMgaW50IGN6X2dldF9wZXJmb3Jt
YW5jZV9sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBjb25zdCBzdHJ1Y3QgcHBfaHdfcAog
CWRhdGEgPSAoc3RydWN0IGN6X2h3bWdyICopKGh3bWdyLT5iYWNrZW5kKTsKIAlwcyA9IGNhc3Rf
Y29uc3RfUGh3Q3pQb3dlclN0YXRlKHN0YXRlKTsKIAorCWlmICghcHMpCisJCXJldHVybiAtRUlO
VkFMOworCiAJbGV2ZWxfaW5kZXggPSBpbmRleCA+IHBzLT5sZXZlbCAtIDEgPyBwcy0+bGV2ZWwg
LSAxIDogaW5kZXg7CiAJbGV2ZWwtPmNvcmVDbG9jayA9IHBzLT5sZXZlbHNbbGV2ZWxfaW5kZXhd
LmVuZ2luZUNsb2NrOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
