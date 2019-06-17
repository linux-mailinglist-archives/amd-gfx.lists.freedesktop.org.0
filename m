Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DC44902C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3363A89FEA;
	Mon, 17 Jun 2019 19:47:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271F489FA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:19 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so12250632qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rcYlXeSjKKTJOp/S+4wjOIwFhzjyYWpigeBmqOca57U=;
 b=Yn98WapXwj/9YJq+V/lKTZP5qMENdV9WlMPkf7ua9+j81p3lsjPwqwCpXQ4+52hazA
 Vjf8IzLeOY7pNAg4+l0FphppVWeSlGmGgXCGcxW9L3ZzdVoNDQeke6bIDLhs0YZqsOse
 0buZMFVNC0VY8RVewjrFN3SkOuOEYmr5fnbTwTRanuMqV09XVI4qNAZm9DMKApvjxle1
 8lrf1QJl8rZVHI7HidYpolFL4rrW654Bgxp31MQZ3YFxu+A3vvvSQktgynBjjsYkGWEn
 si657JQnEvcl6j33qIiYJozmKqK+HAjSNH7bS48s5oUt641zmIQegwk/blPrUYicKfvh
 aluQ==
X-Gm-Message-State: APjAAAU3VLv/BV2XfVv5SMqn71E62m9hWvi5szM0N3Jgaal9cjedmLqM
 6KaGdJAQrmWp9Ly1y3gCH7c5tfa7X3A1iw==
X-Google-Smtp-Source: APXvYqxTawxnAXxS3YCBa9ELYLUwbSwHxy1s+6TTsDLp60bkPjgttt6fOXPbS5Vo+srfF+ki5Mw/AQ==
X-Received: by 2002:ac8:45d2:: with SMTP id e18mr93954196qto.258.1560800838165; 
 Mon, 17 Jun 2019 12:47:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 382/459] drm/amd/display: fix can not turn on two displays due
 to DSC_RESOURCE failed.
Date: Mon, 17 Jun 2019 14:45:23 -0500
Message-Id: <20190617194540.18497-83-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rcYlXeSjKKTJOp/S+4wjOIwFhzjyYWpigeBmqOca57U=;
 b=prVdhRdShQzq32jmqNHH3VGZPhomy8y6me2rCON/tv3t9KSGnGT9lCs3mDTHf5mxUC
 lfTr38M3s8azxgy1OdZUgzXaTAPJoANgkkgOhXqYHe0etdLwpQ7n/OM3HTaBVS8wHhsd
 vPmjY+EVIIHT2r4Hp9oaD1D7ONiE+xzFYX/Iqc/gmgnD+wgi7DUHPskyQEv9Y1jV0TM/
 0zMRtXsWJAEvqTssX3WCM+2HnUlZmzW7m7vbMzUdOKVnIFYaHeSoI2i5TUwxVec8gSOw
 AKLdouprRx8lvQsltPSsmBiuMndD/jWyVU1G/qH9BasfDrwGniLpuA7G+9xlOAMwmE4b
 o8AA==
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
 Charlene Liu <charlene.liu@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltXaHldCkNhbiBub3Qg
dHVybiBvbiB0d28gZGlzcGxheXMgYXQgdGhlIHNhbWUgdGltZSB3aXRoIHRoZSBhc2ljIGhhdmlu
ZyBvbmx5IG9uZSBEU0MuCkRDX0RTQ19SRVNPVVJDRSBhbGxvY2F0aW9uIGZhaWxlZC4KCltTb2x1
dGlvbl0KT25seSBhZGRfZHNjIGlmIHRoZSB0aW1pbmcgaXMgZHNjIGNhcGFibGUgYmFzZWQgb24g
ZGlhZ19kYyBhbmQgbnVtX2RzYwoKU2lnbmVkLW9mZi1ieTogQ2hhcmxlbmUgTGl1IDxjaGFybGVu
ZS5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFdlc2xleSBDaGFsbWVycyA8V2VzbGV5LkNoYWxt
ZXJzQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFr
aGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBf
cmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jCmluZGV4IGRjM2FhN2RlYmFkNS4uZTNjZDNlM2RiMmM0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpA
QCAtMTI4NCw2ICsxMjg0LDEyIEBAIGVudW0gZGNfc3RhdHVzIGRjbjIwX2FkZF9zdHJlYW1fdG9f
Y3R4KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqbmV3X2N0eCwKIAkJCWlmIChwaXBl
X2N0eC0+c3RyZWFtICE9IGRjX3N0cmVhbSkKIAkJCQljb250aW51ZTsKIAorCQkJaWYgKElTX0RJ
QUdfREMoZGMtPmN0eC0+ZGNlX2Vudmlyb25tZW50KSB8fAorCQkJCWRjLT5yZXNfcG9vbC0+cmVz
X2NhcC0+bnVtX2RzYyA9PSAxKSB7CisJCQkJLy8gRGlhZ3MgYnVpbGQgY2FuIGFsc28gcnVuIG9u
IHBsYXRmb3JtcyB0aGF0IGhhdmUgZmV3ZXIgRFNDcyB0aGFuIHBpcGVzLgorCQkJCS8vIEluIHRo
YXQgY2FzZSwgYWRkIERTQyBvbmx5IGlmIG5lZWRlZCBieSB0aW1pbmcuCisJCQkJaXNfYWRkX2Rz
YyA9IChkY19zdHJlYW0tPnRpbWluZy5mbGFncy5EU0MgPT0gMSk7CisJCQl9CiAJCQlpZiAoaXNf
YWRkX2RzYykgewogCQkJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLmRzYyA9IGFjcXVpcmVfZHNjKCZu
ZXdfY3R4LT5yZXNfY3R4LCBwb29sKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
