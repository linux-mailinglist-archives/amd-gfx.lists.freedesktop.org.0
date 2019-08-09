Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E27F87EA7
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0616EE51;
	Fri,  9 Aug 2019 15:53:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39F36EE4A
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:31 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z4so96320598qtc.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GwobPizFxOvLNh3uHWWOUA6Pl0HUQCVwP1SqBOzWcks=;
 b=h/jdVJOXuiA3tMiPtv1+W+BIlH1uu93h0Y75LxbZ31+jZ2RoZD6R/d6r84tn1FL6wj
 B0WJK0WLJNWKX2FRUU1uUflFBnWNYUtq7AR/aUxP8YsjLLD8wafYv/6NjtvfLuHbBgyn
 Vy8T3qw8FYtPXjxEOvv+lezdqibOKWVb6DwaqCFDsAaH7qH+NHVpiNgbbQzuuT3SaTSN
 bdzasTVR8KYnpoDqWumpH3PIlFmviy35LFoS5B05o4FgE78jQS5NcqUH8GosAPJR+rI3
 IPATamEcbMpNp1pNkmDGXDTYi4+fvxbg9mRfTm/2BoJl3KHeRhgQRCSsBfhfH5+aBJn9
 tKNw==
X-Gm-Message-State: APjAAAX8vvN6YU5pnLAKTMZJof9TVuodyrVPYGdKn0AKa+cNIwhSYst9
 BR/XN6sw3yulAcymhF1DeHsSc+ze
X-Google-Smtp-Source: APXvYqwWpZKdlvGHYQSG8eze2aFXxa6KwKLPimYtEF2cBSUksNSg625uGRquqtGS/ltdUjjLnnMm5g==
X-Received: by 2002:a0c:acfb:: with SMTP id n56mr18598871qvc.87.1565366010514; 
 Fri, 09 Aug 2019 08:53:30 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 23/27] drm/amdgpu: update lbpw for renoir
Date: Fri,  9 Aug 2019 10:52:58 -0500
Message-Id: <20190809155302.4733-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GwobPizFxOvLNh3uHWWOUA6Pl0HUQCVwP1SqBOzWcks=;
 b=SMXtJO23U0UGfn3EuVvUKgugdeCj54PotEcpm5RHFInsrTZwTHc5R6130G6fxwlMNa
 hqQ5LQSmbHfQZWCqlXcV5mT5LbAMzy0E/1Jy8vylJP3hVuJxKPAThNJWZRCAI8VTxZsa
 wE3rULfgJ9ipME9gNvjGgfe17cHO5PDJLR45ERzazTpBn+JU7m+xT2ZGjwEP0nRde3aG
 HLsKTzfVgUF1K3gkhpowWWb6r5TMdQzbv2MUVdTVgGH92EkHQTtzuZEY1pmfxgFLbQaz
 cmrprlNcZCZJPFD57SmMj8od8zeNMyEVzQLL74ijqLlHKBz2zRDaq/FEi9mgGvOpsfMD
 u9+g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCmVuYWJsZSBnZnhfdjlfMF9pbml0
X2xicHcgZm9yIHJlbm9pcgoKU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggMmFhZTMzNzNlYWJlLi4x
MTM2MzQwOGFkMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMTY0
NCw2ICsxNjQ0LDcgQEAgc3RhdGljIGludCBnZnhfdjlfMF9ybGNfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQ
X1JBVkVOOgorCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCWdmeF92OV8wX2luaXRfbGJwdyhhZGV2KTsK
IAkJYnJlYWs7CiAJY2FzZSBDSElQX1ZFR0EyMDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
