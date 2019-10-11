Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56119D3743
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9546EB95;
	Fri, 11 Oct 2019 01:45:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E60E6EB94
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:49 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id u184so7502108qkd.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NcKAmKuPvbx/TuNuxNQwC8euK4XIW8wpfSZM8JYTwfg=;
 b=fCKundJmNjL3458RCslDtNzQLDmzFxsCFM55hW2X/Ar1hiyDuUN3FbLzyBw7936FKg
 FFowo+H9JrIotSZcXbRYpYsQMy2QlyBnNuHHzHCzN/bXo6sCp9QGenKAcZyDdtPJ+cf0
 6ErJjNsU7Va4BfbQBKgk5bBLbWaLzFHwyTehHTCMkwlPFEm9ctnRxpx5nFRvY3fRSMLG
 WjeNbllj7bpNFJhz7ecSRYTd+WcjmhJ5udLQJZDDh2+PSU/OsaEv91Qn2/y1h33D44+H
 pVSJzFHFtj+ir7oSH0kArBxj5WcHjLBQvuhxfSwsFtgrLc4GMUZ2lckPGPYzYpRLmgge
 DqSQ==
X-Gm-Message-State: APjAAAUldfNXVPI2LoGU2+7KCNT1Fsc3JjSK4HZy1EMA2uOMm1EOcV42
 S+gZ27/uHv4+9WJUlKOGQVbi3DA2
X-Google-Smtp-Source: APXvYqwI+B+VHQTKUMZD1nlwTN9AitvHAqi3AfpIO1oLTgrsqupL2GPyrINvcWPJOcRXk/LwR1pDDQ==
X-Received: by 2002:a37:883:: with SMTP id 125mr12926835qki.478.1570758348419; 
 Thu, 10 Oct 2019 18:45:48 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 03/19] drm/amdgpu: add supports_baco callback for SI asics.
Date: Thu, 10 Oct 2019 20:45:20 -0500
Message-Id: <20191011014536.10869-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NcKAmKuPvbx/TuNuxNQwC8euK4XIW8wpfSZM8JYTwfg=;
 b=vGnlir3Jn10KBhC29WuA3OCpLOgfDzvRKODy160ayK0i5Oo194CwIhgrcMDWANrfeT
 jXQ5cjX/wF3cSrIR991NIg7tvC7P9WpS1oUqOFVjkTYXUcNxAQHevAU5J0GG1JOXd3c/
 PSAdWVB+t6OjIB3PcxUWvf5YBgtq53dxU06Li3tS5/Bxry3Qo1s85cslPIhfz0emJoNw
 KTe7ehUEL6IqiqLXkB0/V97lu5LZLYlwoTv0e3G/D1FRCnM+S8mFKZyjyOEz0R/hQsac
 PepC9G/ydqyl7VTqKvMiJFHGf1txsnXjW5E3cSzdIS7glE030bM8bEkjdZ+l7FLHyNtQ
 sDPQ==
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

Tm90IHN1cHBvcnRlZC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jIHwgNiAr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c2kuYwppbmRleCA0OTNhZjQyMTUyZjIuLjQwMWU0MzI1NWE2NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zaS5jCkBAIC0xMTg2LDYgKzExODYsMTEgQEAgc3RhdGljIGludCBzaV9hc2ljX3Jlc2V0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCitzdGF0aWMgYm9vbCBz
aV9hc2ljX3N1cHBvcnRzX2JhY28oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJcmV0
dXJuIGZhbHNlOworfQorCiBzdGF0aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCiBzaV9hc2ljX3Jl
c2V0X21ldGhvZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKQEAgLTE0MTQsNiArMTQx
OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2FzaWNfZnVuY3Mgc2lfYXNpY19mdW5j
cyA9CiAJLmdldF9wY2llX3VzYWdlID0gJnNpX2dldF9wY2llX3VzYWdlLAogCS5uZWVkX3Jlc2V0
X29uX2luaXQgPSAmc2lfbmVlZF9yZXNldF9vbl9pbml0LAogCS5nZXRfcGNpZV9yZXBsYXlfY291
bnQgPSAmc2lfZ2V0X3BjaWVfcmVwbGF5X2NvdW50LAorCS5zdXBwb3J0c19iYWNvID0gJnNpX2Fz
aWNfc3VwcG9ydHNfYmFjbywKIH07CiAKIHN0YXRpYyB1aW50MzJfdCBzaV9nZXRfcmV2X2lkKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
