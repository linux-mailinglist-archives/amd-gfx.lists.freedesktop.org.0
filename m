Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EAA628AD
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 20:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1336E036;
	Mon,  8 Jul 2019 18:48:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C9C6E036
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 18:48:27 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z4so15629365qtc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 11:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OECMCaLhBWGtWTVE5pR43PVEiHPSO4DHWdQo51vyt0I=;
 b=V4HmALW8DHiPShC6ohj+DRGSauE4JEQ4L5IYKo/TfhpBy2AQReqQLQbX/1JQO43FkI
 pS1mwNgJF5rPNqpe+6r77Yb1xEWmVIF4k2kBaPeFuvRVSsJVS0vDCwrYwJ0i0S2qtz8C
 fuq6u1wu6Mq0xA/ePm6zdjEiSPyWlZS0AoHQ4enDLoaF7TnHpHA3T3/OQ/l5B7Ium6zu
 BdaJxLtkJ1YH1SwpgVPLLVLXdnr7MCT/8xYjONDJgeltZrpm2PhFRwETOATinlBm8CKj
 TC93N29HcWJ8Ujcsw4XkWyX8vP+E4RAnHaZNAQ4JsmxrLrcDaALYycsDVHsVd6FrMEsT
 aqEg==
X-Gm-Message-State: APjAAAXDx2crx0m2296m3mbuYvd8sJ9R6GDBAOqiRQmpW9OP5xvbV7u9
 X/xQTFDZawzGylJAQRdBH/GaZheb
X-Google-Smtp-Source: APXvYqxxJAszybqhpeq8fihsOz2+HnS7e4J0p48yQDHPFzf2+SDtlr1LaliKgt/w/tyyUhkJkf+38A==
X-Received: by 2002:ac8:397c:: with SMTP id t57mr11191707qtb.21.1562611706483; 
 Mon, 08 Jul 2019 11:48:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id h26sm8954179qta.58.2019.07.08.11.48.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 11:48:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: properly guard the generic discovery code
Date: Mon,  8 Jul 2019 13:48:10 -0500
Message-Id: <20190708184811.6409-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708184811.6409-1-alexander.deucher@amd.com>
References: <20190708184811.6409-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OECMCaLhBWGtWTVE5pR43PVEiHPSO4DHWdQo51vyt0I=;
 b=q/vrAaDgaRh2uiAwbixtvHbTh7AA8J7CpeR7b+okAWvRxxEECmSchKtXDctP27ijnn
 0211RvUw9o/6kP0WI2zV13yyCUAuxIZ48nT0hNnb+YvJcnWk1BEH8iDtLfjeH6q3MEoI
 ZXszCU1NYxTobnK22Hja6l6PrGk0J4+PbR7uLhggzBOSI1mt2PH04nNqjagNT9KoZZnp
 IXGO1Xb30oPsTxR8hl5f88jLjchHOpzdWXpqWcjROBlgHDJXOuCTyrzBWZp4apH9Rhnx
 MHeWoJFpI7wxKnP1liFaROtJZ08k88Bs859w667upgkFtaIQOjfd1EkTJHMKGkVqZ6hK
 GC/w==
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

SXQncyBvbmx5IGF2YWlsYWJsZSBvbiBuYXZpIGFuZCBuZXdlci4KClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDhmMGYyMDdiZjNkOS4uNmNmMzE3NWJjZjg1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0yNjIzLDcgKzI2
MjMsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAogCWlmIChhbWRncHVfbWVzICYmIGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkKIAkJ
YWRldi0+ZW5hYmxlX21lcyA9IHRydWU7CiAKLQlpZiAoYW1kZ3B1X2Rpc2NvdmVyeSkgeworCWlm
IChhbWRncHVfZGlzY292ZXJ5ICYmIGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkgewog
CQlyID0gYW1kZ3B1X2Rpc2NvdmVyeV9pbml0KGFkZXYpOwogCQlpZiAocikgewogCQkJZGV2X2Vy
cihhZGV2LT5kZXYsICJhbWRncHVfZGlzY292ZXJ5X2luaXQgZmFpbGVkXG4iKTsKQEAgLTI4OTEs
NyArMjg5MSw3IEBAIHZvaWQgYW1kZ3B1X2RldmljZV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCWFtZGdwdV91Y29kZV9zeXNmc19maW5pKGFkZXYpOwogCWFtZGdwdV9wbXVfZmlu
aShhZGV2KTsKIAlhbWRncHVfZGVidWdmc19wcmVlbXB0X2NsZWFudXAoYWRldik7Ci0JaWYgKGFt
ZGdwdV9kaXNjb3ZlcnkpCisJaWYgKGFtZGdwdV9kaXNjb3ZlcnkgJiYgYWRldi0+YXNpY190eXBl
ID49IENISVBfTkFWSTEwKQogCQlhbWRncHVfZGlzY292ZXJ5X2ZpbmkoYWRldik7CiB9CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
