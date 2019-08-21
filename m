Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6098707
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399A16E39C;
	Wed, 21 Aug 2019 22:20:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57546E39C
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:20:47 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j15so5042718qtl.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8OvSoOo0oAOnk+SompLk6ksG54kcmP/KCc3pIKsVUYU=;
 b=Pyqm3znINMMp+uFjUgNgHXVid7lbMBPrAp5QZ6DJP2uGUUCoDfgKJK6iCU6GnCtRaC
 MklgZDaHTUqAZsxwrFpHTtBnwZQhMNPlWCKVFTvtc57ZKjOWdrVu2jDS9Pxd+CyjueyA
 OgniH3LO/CrSS3FHDbGnBg8+4idkciG8lP4hYLS82bbTUZxhWuaWhnmkn2q4YNZGD6tc
 amzpu/euOy0mpxscyG/Nk0zzqT9xCJ7olL8CYIOPk/VerCoAimcajx1znr3z6Jf/JOnk
 ZWy9S0ftvBBJKRadKV0Y5THIcLVG5WpxET2o4AHovS51lij0sJ+Y+/jfvgMOCk1bXgBg
 wllw==
X-Gm-Message-State: APjAAAXbFp81PnVQZXu8n6oEqwIHLebAlTulieuDHrXMpGc+De99fSCs
 nnQYd/+Ey5TzWuN8LVN+X3BGsoyL
X-Google-Smtp-Source: APXvYqwvK2BnlybXVUForyqJ/PMNr0/aeAbp0PkAuMobN4vpHpsbkwmAGdMVyIrNw8ApHVDfb2YaUQ==
X-Received: by 2002:aed:34a6:: with SMTP id x35mr33014873qtd.187.1566426046712; 
 Wed, 21 Aug 2019 15:20:46 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w10sm10674525qts.37.2019.08.21.15.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:20:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] XXX: hack: disable HG and use PX
Date: Wed, 21 Aug 2019 17:20:32 -0500
Message-Id: <20190821222034.13387-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222034.13387-1-alexander.deucher@amd.com>
References: <20190821222034.13387-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8OvSoOo0oAOnk+SompLk6ksG54kcmP/KCc3pIKsVUYU=;
 b=dQvTd2PJJ0oCqOpdkh7e896nIvjXy93tCIvpk5bdtrOMH0DUHw/UstJDjqCU2OVATs
 gaPwqQ2JLvUXBHoUIf7ubjGDErY/y84RFuVZbX2dHS952lKQTnCzKZCwTq7ujPEtzgGB
 P37kPrxfRz7DGpfNAogd2LFu85Hpls4vBTF1iqluMP8jcF+EsMqod2J54rhBCASorm2h
 GblniWgnZ5y9Vljzuwawr8rQx4OQli2bmJfJwo1+ttv+aOkFQxNbORCN0sk4EQlNBLlI
 cH4gFN/nwqK5pByH8I37VD1mljpOdoGNKC6b9ee6rkPGYkfpltE4TlJuDuwAstJMmygJ
 OfTA==
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

U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYyB8IDYg
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRs
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYwpp
bmRleCBjMTNjNTFhZjBiNjguLjlkOTAwNGFmYzgxYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0cHhfaGFuZGxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYwpAQCAtMjA1LDEzICsyMDUsMTMgQEAg
c3RhdGljIGludCBhbWRncHVfYXRweF92YWxpZGF0ZShzdHJ1Y3QgYW1kZ3B1X2F0cHggKmF0cHgp
CiAKIAlhdHB4LT5pc19oeWJyaWQgPSBmYWxzZTsKIAlpZiAodmFsaWRfYml0cyAmIEFUUFhfTVNf
SFlCUklEX0dGWF9TVVBQT1JURUQpIHsKLQkJcHJpbnRrKCJBVFBYIEh5YnJpZCBHcmFwaGljc1xu
Iik7CisvLwkJcHJpbnRrKCJBVFBYIEh5YnJpZCBHcmFwaGljc1xuIik7CiAJCS8qCiAJCSAqIERp
c2FibGUgbGVnYWN5IFBNIG1ldGhvZHMgb25seSB3aGVuIHBjaWUgcG9ydCBQTSBpcyB1c2FibGUs
CiAJCSAqIG90aGVyd2lzZSB0aGUgZGV2aWNlIG1pZ2h0IGZhaWwgdG8gcG93ZXIgb2ZmIG9yIHBv
d2VyIG9uLgogCQkgKi8KLQkJYXRweC0+ZnVuY3Rpb25zLnBvd2VyX2NudGwgPSAhYW1kZ3B1X2F0
cHhfcHJpdi5icmlkZ2VfcG1fdXNhYmxlOwotCQlhdHB4LT5pc19oeWJyaWQgPSB0cnVlOworLy8J
CWF0cHgtPmZ1bmN0aW9ucy5wb3dlcl9jbnRsID0gIWFtZGdwdV9hdHB4X3ByaXYuYnJpZGdlX3Bt
X3VzYWJsZTsKKy8vCQlhdHB4LT5pc19oeWJyaWQgPSB0cnVlOwogCX0KIAogCWF0cHgtPmRncHVf
cmVxX3Bvd2VyX2Zvcl9kaXNwbGF5cyA9IGZhbHNlOwotLSAKMi4xMy42CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
