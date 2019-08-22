Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BBD99843
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 17:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954556E9F3;
	Thu, 22 Aug 2019 15:36:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93FB6E9F3
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 15:36:53 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m10so5532677qkk.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 08:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=np9ljcH5r75OLmoMzu3g6geK5KFNLSTrLcW+Gi53p8s=;
 b=ZTxjTJEhZqNxzGz41ROVPH5hYClpAkPIuzOTOxPqY45zrfyDHnsVDGnqR/T6j6Y0E6
 JuCYjr8y6XWSFOPPzY3V84JBwDOhgOlZzVLUJDwRURP10j+1AoxzE08gOgVwFArgy98J
 PMsrNlCCA4pqG504kEDopKjDcOttDB/C9XtNaGB2r8fO45Y+YW13UOD0nUG//w6R9938
 ZCNRK88/5Q5htTN/oWx7BQVFTD9WOUnG3Cgy788jD9CR801Sw8zisqg8IzTU1MOsXEFs
 HeeRwQKShg5+Fxl5SQtHRRgR5kBmCgTkzOQ8Q9FT9rx2KdbUT8zt48KLXZ3blj3db0FF
 zCVw==
X-Gm-Message-State: APjAAAXF2dQbbkuxQn10UJlMr3IsZBq/vJ/lkr8Qh0+CPTjpwCiAcsw4
 /N1t8BL6n3sTi2V2k2mwv7i43/Ye
X-Google-Smtp-Source: APXvYqywHQ6cbfos6clOt3DcXWcbQz/PJU0nMOFtfHkhKDx8WlsEdNl/7W0edf7C1Bj32+ywVe+jgg==
X-Received: by 2002:a37:64c8:: with SMTP id
 y191mr17745039qkb.210.1566488212780; 
 Thu, 22 Aug 2019 08:36:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id x3sm7958qkl.71.2019.08.22.08.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 08:36:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] Support mclk switching when monitors are in sync
Date: Thu, 22 Aug 2019 10:36:42 -0500
Message-Id: <20190822153645.3296-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=np9ljcH5r75OLmoMzu3g6geK5KFNLSTrLcW+Gi53p8s=;
 b=BwtBg3535v3CorWTJqvGy7yaRMj4IX7HT5IpuS9cVjuIskJFRwND841I+ylU8uNKed
 ePRzog4KSTjN6mcDpkDpIOIcECxozw/sM29r3vhMm5dXEDE4SVR2Qql95kR8YGHRXKGX
 uif+t7A94hwaPwsJABVPo8zR1aNrwc+KHcRSBghXOsp7XTFQvNVD9pck7HBZo2mEUg1N
 tf8EB2QLhnWX7VZ6TFfKBTLLrbPCA9CG28Kqr4QHJZhw6+eU0Nz8i5FUcSer7r+KvRYJ
 BH68jc/YeFBvswJzlMWwjFwp8qUM8euDVbc1d6U2PujOStJXjlItdWjns+fwS1dGTACl
 UokA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXQgZW5hYmxlcyBtY2xrIHN3aXRjaGluZyB3aXRoIG11bHRpcGxlIG1vbml0
b3JzIHdoZW4gYWxsCm1vbml0b3JzIGFyZSBzeW5jLiAgTm9ybWFsbHkgbWNsayBzd2l0Y2hpbmcg
aXMgbm90IGF2YWlsYWJsZSB3aXRoCm11bHRpcGxlIG1vbml0b3JzIGJlY2F1c2UgdGhlIHZibGFu
ayB0aW1pbmcgZG9lcyBub3QgbGluZSB1cC4gIEhvd2V2ZXIsCmlmIHRoZSB0aW1pbmcgaXMgaWRl
bnRpY2FsLCB0aGUgZGlzcGxheSBkcml2ZXIgY2FuIHN5bmMgdXAgdGhlIGRpc3BsYXlzCmluIHNv
bWUgY2FzZXMuICBDaGVjayBmb3IgdGhlc2UgY2FzZXMgYW5kIGFsbG93IG1jbGsgc3dpdGNoIHdo
ZW4KcG9zc2libGUuCgpBbGV4IERldWNoZXIgKDMpOgogIGRybS9hbWRncHUvcG93ZXJwbGF5L3Nt
dTc6IGVuYWJsZSBtY2xrIHN3aXRjaGluZyBpZiBtb25pdG9ycyBhcmUKICAgIHN5bmNlZAogIGRy
bS9hbWRncHUvcG93ZXJwbGF5L3ZlZ2ExMDogZW5hYmxlIG1jbGsgc3dpdGNoaW5nIGlmIG1vbml0
b3JzIGFyZQogICAgc3luY2VkCiAgZHJtL2FtZC9kaXNwbGF5OiB1cGRhdGUgYndfY2FsY3MgdG8g
dGFrZSBwaXBlIHN5bmMgaW50byBhY2NvdW50ICh2MikKCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jYWxjcy9kY2VfY2FsY3MuYyAgfCA0OSArKysrKysrKysrKysrKysrKystCiAuLi4vZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYyAgfCAgNyArLS0KIC4uLi9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyAgICB8ICAzICstCiAzIGZpbGVzIGNo
YW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
