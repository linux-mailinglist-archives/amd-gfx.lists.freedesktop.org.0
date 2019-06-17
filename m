Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC449004
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F97F89E4C;
	Mon, 17 Jun 2019 19:46:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BECA89E4C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:38 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p15so12315001qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dr/Aoy4vzCvcDeWlHThCSiILu2ooj1Zc7uX2kD0SytQ=;
 b=tgmxkv3KskWL2c8t8NmmmAvJm4+1KDjvJkIiWDeIzBKL36qPXOPsSo/m9VLG86CXST
 Sg2U8kXaE8BfsU5JxjXNuVgSzUVwuhnpS7i3CEl84Om+2Hyjw54cN9HXLJObTRnvRVmp
 6isKwsh5eP8tNgWdinCdt7B0pm5E2M41ol7JreJUvrB3zS3LNQM4HgObEKKL6wZcx1oK
 41iLxz6+78HTzvPnHYpdOgWaUAiaiKOqhDBVEJk+hcYrd9Fr1AYxSlZVxgrFBnzttrz3
 pDZpjARvoSGLfRcYCPyFMYpwufnQxUI/UNjk7iOUkyxiR6XV2lj9oYlU5fTQndSpXQ5z
 znDA==
X-Gm-Message-State: APjAAAVXihthtMO2l3YGnwHgqFwoPkpZj00+oz3cdHxJnJ+2ETDoNUqy
 OjrXxtBdAfComn5PPwrW998d0iLVJqo=
X-Google-Smtp-Source: APXvYqw/TGT6glkMpB1Qz9Z00nNNCucuEL7+6L3gl/zahHVAJvZ/s9HGDfn4pCXHlsBHnphoUMtjDQ==
X-Received: by 2002:a0c:95af:: with SMTP id s44mr22109858qvs.162.1560800797445; 
 Mon, 17 Jun 2019 12:46:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 342/459] drm/amdgpu: Enable DC support for Navi10
Date: Mon, 17 Jun 2019 14:44:43 -0500
Message-Id: <20190617194540.18497-43-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dr/Aoy4vzCvcDeWlHThCSiILu2ooj1Zc7uX2kD0SytQ=;
 b=lcQNvtoMwRIBC3QHJIIHDsbH6Ux9TwVIdUb6xz8uhWmBF35hegxEAPk7rzvRibvJrF
 Xe3ehghUKItkMJs3KSNOSL+SM2PRJ9mKpV4vm0yC2aj+8DSRfRu9OatjQmXf3i1XWR5x
 wkFnkHqfb+SxCXM/WN4In5Dm8l8fIquxT/EcXHHc8TRNcUmk1Tg6bM4F2dCZsq8fpQM5
 g4qoxUHWRege9b+AmUSixPGc/uEQtydoDm1FqmX1dBfXfWQpHWMk92Qwtir0C6wBUEwR
 FUav8NJYfGZlti1WTBDekfbEbsaGlOc4qLk/k9iPvF46mNV10ORggeRIqSjy1pyC2xTb
 sYRg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CgpTaWduZWQtb2Zm
LWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDMgKysrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udi5jICAgICAgICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YwppbmRleCA2OTcwZDNmNTZjNTEuLjRkNDY4ZmQ2MzUyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMjQyMSw2ICsyNDIxLDkgQEAgYm9vbCBhbWRn
cHVfZGV2aWNlX2FzaWNfaGFzX2RjX3N1cHBvcnQoZW51bSBhbWRfYXNpY190eXBlIGFzaWNfdHlw
ZSkKIAljYXNlIENISVBfVkVHQTIwOgogI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENO
MV8wKQogCWNhc2UgQ0hJUF9SQVZFTjoKKyNlbmRpZgorI2lmIGRlZmluZWQoQ09ORklHX0RSTV9B
TURfRENfRENOMl8wKQorCWNhc2UgQ0hJUF9OQVZJMTA6CiAjZW5kaWYKIAkJcmV0dXJuIGFtZGdw
dV9kYyAhPSAwOwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCAzY2ZjMTViZTZm
ZjguLmU3MDViNDUzYjdjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC0zNDgsNiArMzQ4
LDggQEAgaW50IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJ
CQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc211X3YxMV8wX2lwX2Jsb2NrKTsK
IAkJaWYgKGFkZXYtPmVuYWJsZV92aXJ0dWFsX2Rpc3BsYXkgfHwgYW1kZ3B1X3NyaW92X3ZmKGFk
ZXYpKQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRjZV92aXJ0dWFsX2lw
X2Jsb2NrKTsKKwkJZWxzZSBpZiAoYW1kZ3B1X2RldmljZV9oYXNfZGNfc3VwcG9ydChhZGV2KSkK
KwkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkbV9pcF9ibG9jayk7CiAJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjEwXzBfaXBfYmxvY2spOwogCQlh
bWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NV8wX2lwX2Jsb2NrKTsKIAkJ
aWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9ESVJFQ1QgJiYK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
