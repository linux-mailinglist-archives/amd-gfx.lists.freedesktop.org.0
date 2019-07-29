Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC5E79974
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452D189EAC;
	Mon, 29 Jul 2019 20:15:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E746E293
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:28 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id 34so24549799uar.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ImjJoEgakBt4trNIWVSpMVAZn9O4vK8knFAh2Ht1bDY=;
 b=fc5WyTPCPtWmTVRAjahmwLMKIEGahnzzAqYPJbgQ/oAZVUeQYPM499TPYPAEgp7WSQ
 55qKqmifC1kk03KX76hXz/Gk/C9Nx4rY6tcBo0gZOEmHSwk2GApmkRC4zKVVfEs+XFd2
 SQ1FhD6JjicVCF7IDnOg7bFLhE65Bn9z7vJsM3/z/IymAgy4qvGjpsu1klEbbLapWLRB
 JwewfHBshjVEI/rkYomVdFp3FewRfYQLjHOQGOby12LA3V2ShbIvjUAEyrJcldG0HLGb
 fJze4JoWwqYRYSBaWg4CgM8UM0YeX3fndHgrctCp3z2lHB97umHBwDxjs0KinDRCQBK0
 VCOw==
X-Gm-Message-State: APjAAAXy3nGGYLQySGnXp8ByWQn3kELeFudaVVm4aXtvC4QggRg3DM7v
 9eODIf4bISIee1cZiyqqfpVyZXgT
X-Google-Smtp-Source: APXvYqynvHV5FxrOiRYuvoVkowFUOQ+KhO2TCUbE2cL7HechXb3DbLJjdsGmR4YaZJ/Dc3MlZSqTZQ==
X-Received: by 2002:ab0:4744:: with SMTP id i4mr58405553uac.63.1564431327298; 
 Mon, 29 Jul 2019 13:15:27 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/30] drm/amd/powerplay: enable arcturus powerplay
Date: Mon, 29 Jul 2019 15:14:46 -0500
Message-Id: <20190729201508.16136-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ImjJoEgakBt4trNIWVSpMVAZn9O4vK8knFAh2Ht1bDY=;
 b=XMvDtOOLvqOUN+aPYyD5VfiBd/9bxPpomEDHPDW3uI2VuLk6FfmKOJvhufWGG2RHfs
 0xpj89WIMH4CSoz+KKz5lWPPT4T823DP5TKcoLUS63CKXsAsMH2kGq0bqP2PBBh3Bm5l
 FeLDMfX+h9843SrSue0doZxOFJ+z6Us0oLsM5b3Gtqb5rKFKvy1/P4IhyXFbhle+Plu0
 ASnBmxltUyV8oZRKBCk2nsGQLjXbSypDPb9PZyksiKt5tlymiLhtMlfbCyi1a/ErZnG4
 IguBicar9UwGdlel66C7w9V3p7hd0b3H5pACDr/hRswGzyKaazb299bpYJ/dokzYASr2
 PYCA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkFyY3R1cnVzIHBvd2VycGxheSBp
cyByZWFkeSB0byB1c2UuCgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDQ0MDVi
OTgzZGQwOS4uMzQ3YTQ0ZjI3NTdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAg
LTY5Niw2ICs2OTYsNyBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2Vfdmly
dHVhbF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhf
djlfMF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzZG1h
X3Y0XzBfaXBfYmxvY2spOworCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc211
X3YxMV8wX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZj
bl92Ml81X2lwX2Jsb2NrKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
