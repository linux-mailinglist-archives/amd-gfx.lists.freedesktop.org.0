Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84453D36D5
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98086EB99;
	Fri, 11 Oct 2019 01:21:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EA76EB99
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:21:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 3so11637818qta.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kb0QfUUQlnltohv9XOSeZk2ILrRvhLcZYAhjU1XbA8w=;
 b=bQmlYyWjqhQDDzAYhZrokUe215BCwr9P1gFzhuJeCLl2Xny+EPpr+LtpcjFEhMZdpX
 YBrzfcjx2KNAprFMjR6JxSo8n0KpepAMYSWPvzC5C+CfNCpCer/I5zo4NJMXCLG+owS9
 VKS4YYzAoPk9+G97wjWrOmiiSNPQTVgU+3R24GLm6mRrWhwMJIAuUrOV/urray4nSwIj
 Hv1OOGO7Vwu85xa08nS+UzuBGuy+aua6TeXHp3siqZvE+7lTZ89pNBiSQHuKih1gw/DG
 d/OGuG4i8fA5B3oKSTNnYypKu/h4QNNgpLrRot+8B2i/BidreqcpwQgjM3bBiPAqBTLc
 hlvw==
X-Gm-Message-State: APjAAAVdT/UWaL1iScTQpcVpxOX2p9w3pfFs7nBKa6R9m5DERIfMEt2a
 q25ZRve5c27I1OQPoHohSqw1zwgm
X-Google-Smtp-Source: APXvYqwvgKBMf7tbV5QglUliL0HrQWXUJ9XBGQEYy4SJhgflbm2pV0CX7EZHgWpRW0EsSyynTde7TA==
X-Received: by 2002:ac8:368b:: with SMTP id a11mr14109317qtc.362.1570756911845; 
 Thu, 10 Oct 2019 18:21:51 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p199sm3301590qke.18.2019.10.10.18.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:21:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/15] drm/amdgpu/powerplay: add support for BACO on Iceland
Date: Thu, 10 Oct 2019 20:21:28 -0500
Message-Id: <20191011012135.18566-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
References: <20191011012135.18566-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kb0QfUUQlnltohv9XOSeZk2ILrRvhLcZYAhjU1XbA8w=;
 b=o+qfiiiqvaQKRTa2NRyWUv+LX1iF+f6VGPtlPXd7yR9kc+R+khRTy4lB2j4sSsCfWF
 BBojcrGH8U+IZ88TgrMDSLKwhohX6Diyj9CBeRpE9R2ftbXO46DErX2tnEDH+0PgSui9
 FgJgK4lnEkiBgKkKIrXLMixzTjs0zJeQ5T+Y06/3ZeZNvD3JPK374jhXiOJ/cLlHg6qJ
 PYXNAUo6CeAYdniExM72VBok5woZ+vjEKh33mD5Od5bolm9KXN8C1lRFskpe2Do+Xt6G
 t+06FDXVy5wZtJl2IoySAvvxqhF0tCOkJ85tcY+PvMfDavyNv/R7Evz8bnfjltB+zylq
 BiyA==
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

VGhpcyBhZGRzIEJBQ08gc3VwcG9ydCBmb3IgSWNlbGFuZCBhc2ljcy4KClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3RvbmdhX2JhY28uYyAgfCA1NCArKysrKysrKysrKysrKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci90b25nYV9iYWNv
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci90b25nYV9iYWNvLmMKaW5k
ZXggMzdhNDFiODNjOTEzLi44NGI3MjE3YjdiZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3RvbmdhX2JhY28uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci90b25nYV9iYWNvLmMKQEAgLTE1Miw2ICsxNTIsMzYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBiYWNvX2NtZF9lbnRyeSBjbGVhbl9iYWNvX3RibFtdID0KIAl7IENN
RF9XUklURSwgbW1CSU9TX1NDUkFUQ0hfNywgMCwgMCwgMCwgMCB9CiB9OwogCitzdGF0aWMgY29u
c3Qgc3RydWN0IGJhY29fY21kX2VudHJ5IGdwaW9fdGJsX2ljZWxhbmRbXSA9Cit7CisJeyBDTURf
V1JJVEUsIG1tR1BJT1BBRF9FTiwgMCwgMCwgMCwgMHgwIH0sCisJeyBDTURfV1JJVEUsIG1tR1BJ
T1BBRF9QRF9FTiwgMCwgMCwgMCwgMHgwIH0sCisJeyBDTURfV1JJVEUsIG1tR1BJT1BBRF9QVV9F
TiwgMCwgMCwgMCwgMHgwIH0sCisJeyBDTURfV1JJVEUsIG1tR1BJT1BBRF9NQVNLLCAwLCAwLCAw
LCAweGZmNzdmZmZmIH0KK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYmFjb19jbWRfZW50cnkg
ZXhpdF9iYWNvX3RibF9pY2VsYW5kW10gPQoreworCXsgQ01EX1JFQURNT0RJRllXUklURSwgbW1C
QUNPX0NOVEwsIEJBQ09fQ05UTF9fQkFDT19SRVNFVF9FTl9NQVNLLCBCQUNPX0NOVExfX0JBQ09f
UkVTRVRfRU5fX1NISUZULCAwLCAweDAxIH0sCisJeyBDTURfUkVBRE1PRElGWVdSSVRFLCBtbUJB
Q09fQ05UTCwgQkFDT19DTlRMX19CQUNPX0JDTEtfT0ZGX01BU0ssIEJBQ09fQ05UTF9fQkFDT19C
Q0xLX09GRl9fU0hJRlQsIDAsIDB4MDAgfSwKKwl7IENNRF9SRUFETU9ESUZZV1JJVEUsIG1tQkFD
T19DTlRMLCBCQUNPX0NOVExfX0JBQ09fUE9XRVJfT0ZGX01BU0ssIEJBQ09fQ05UTF9fQkFDT19Q
T1dFUl9PRkZfX1NISUZULCAwLCAweDAwIH0sCisJeyBDTURfREVMQVlfTVMsIDAsIDAsIDAsIDIw
LCAwIH0sCisJeyBDTURfV0FJVEZPUiwgbW1CQUNPX0NOVEwsIEJBQ09fQ05UTF9fUFdSR09PRF9C
Rl9NQVNLLCAwLCAweGZmZmZmZmZmLCAweDIwMCB9LAorCXsgQ01EX1JFQURNT0RJRllXUklURSwg
bW1CQUNPX0NOVEwsIEJBQ09fQ05UTF9fQkFDT19JU09fRElTX01BU0ssIEJBQ09fQ05UTF9fQkFD
T19JU09fRElTX19TSElGVCwgMCwgMHgwMSB9LAorCXsgQ01EX1dBSVRGT1IsIG1tQkFDT19DTlRM
LCBCQUNPX0NOVExfX1BXUkdPT0RfTUFTSywgMCwgNSwgMHgxYzAwIH0sCisJeyBDTURfUkVBRE1P
RElGWVdSSVRFLCBtbUJBQ09fQ05UTCwgQkFDT19DTlRMX19CQUNPX0FOQV9JU09fRElTX01BU0ss
IEJBQ09fQ05UTF9fQkFDT19BTkFfSVNPX0RJU19fU0hJRlQsIDAsIDB4MDEgfSwKKwl7IENNRF9S
RUFETU9ESUZZV1JJVEUsIG1tQkFDT19DTlRMLCBCQUNPX0NOVExfX0JBQ09fQklGX1NDTEtfU1dJ
VENIX01BU0ssIEJBQ09fQ05UTF9fQkFDT19CSUZfU0NMS19TV0lUQ0hfX1NISUZULCAwLCAweDAw
IH0sCisJeyBDTURfUkVBRE1PRElGWVdSSVRFLCBtbUJBQ09fQ05UTCwgQkFDT19DTlRMX19CQUNP
X1JFU0VUX0VOX01BU0ssIEJBQ09fQ05UTF9fQkFDT19SRVNFVF9FTl9fU0hJRlQsIDAsIDB4MDAg
fSwKKwl7IENNRF9XQUlURk9SLCBtbUJBQ09fQ05UTCwgQkFDT19DTlRMX19SQ1VfQklGX0NPTkZJ
R19ET05FX01BU0ssIDAsIDUsIDB4MTAwIH0sCisJeyBDTURfUkVBRE1PRElGWVdSSVRFLCBtbUJB
Q09fQ05UTCwgQkFDT19DTlRMX19CQUNPX0VOX01BU0ssIEJBQ09fQ05UTF9fQkFDT19FTl9fU0hJ
RlQsIDAsIDB4MDAgfSwKKwl7IENNRF9XQUlURk9SLCBtbUJBQ09fQ05UTCwgQkFDT19DTlRMX19C
QUNPX01PREVfTUFTSywgMCwgMHhmZmZmZmZmZiwgMHgwMCB9Cit9OworCitzdGF0aWMgY29uc3Qg
c3RydWN0IGJhY29fY21kX2VudHJ5IGNsZWFuX2JhY29fdGJsX2ljZWxhbmRbXSA9Cit7CisJeyBD
TURfV1JJVEUsIG1tQklPU19TQ1JBVENIXzcsIDAsIDAsIDAsIDAgfQorfTsKKwogaW50IHRvbmdh
X2JhY29fZ2V0X2NhcGFiaWxpdHkoc3RydWN0IHBwX2h3bWdyICpod21nciwgYm9vbCAqY2FwKQog
ewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICop
KGh3bWdyLT5hZGV2KTsKQEAgLTE5NSw3ICsyMjUsMTAgQEAgaW50IHRvbmdhX2JhY29fc2V0X3N0
YXRlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGVudW0gQkFDT19TVEFURSBzdGF0ZSkKIAkJcmV0
dXJuIDA7CiAKIAlpZiAoc3RhdGUgPT0gQkFDT19TVEFURV9JTikgewotCQliYWNvX3Byb2dyYW1f
cmVnaXN0ZXJzKGh3bWdyLCBncGlvX3RibCwgQVJSQVlfU0laRShncGlvX3RibCkpOworCQlpZiAo
aHdtZ3ItPmNoaXBfaWQgPT0gQ0hJUF9UT1BBWikKKwkJCWJhY29fcHJvZ3JhbV9yZWdpc3RlcnMo
aHdtZ3IsIGdwaW9fdGJsX2ljZWxhbmQsIEFSUkFZX1NJWkUoZ3Bpb190YmxfaWNlbGFuZCkpOwor
CQllbHNlCisJCQliYWNvX3Byb2dyYW1fcmVnaXN0ZXJzKGh3bWdyLCBncGlvX3RibCwgQVJSQVlf
U0laRShncGlvX3RibCkpOwogCQliYWNvX3Byb2dyYW1fcmVnaXN0ZXJzKGh3bWdyLCBlbmFibGVf
ZmJfcmVxX3Jlal90YmwsCiAJCQkJICAgICAgIEFSUkFZX1NJWkUoZW5hYmxlX2ZiX3JlcV9yZWpf
dGJsKSk7CiAJCWJhY29fcHJvZ3JhbV9yZWdpc3RlcnMoaHdtZ3IsIHVzZV9iY2xrX3RibCwgQVJS
QVlfU0laRSh1c2VfYmNsa190YmwpKTsKQEAgLTIwOSwxMSArMjQyLDIwIEBAIGludCB0b25nYV9i
YWNvX3NldF9zdGF0ZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBlbnVtIEJBQ09fU1RBVEUgc3Rh
dGUpCiAJCS8qIEhXIHJlcXVpcmVzIGF0IGxlYXN0IDIwbXMgYmV0d2VlbiByZWd1bGF0b3Igb2Zm
IGFuZCBvbiAqLwogCQltc2xlZXAoMjApOwogCQkvKiBFeGVjdXRlIEhhcmR3YXJlIEJBQ08gZXhp
dCBzZXF1ZW5jZSAqLwotCQlpZiAoYmFjb19wcm9ncmFtX3JlZ2lzdGVycyhod21nciwgZXhpdF9i
YWNvX3RibCwKLQkJCQkJICAgQVJSQVlfU0laRShleGl0X2JhY29fdGJsKSkpIHsKLQkJCWlmIChi
YWNvX3Byb2dyYW1fcmVnaXN0ZXJzKGh3bWdyLCBjbGVhbl9iYWNvX3RibCwKLQkJCQkJCSAgIEFS
UkFZX1NJWkUoY2xlYW5fYmFjb190YmwpKSkKLQkJCQlyZXR1cm4gMDsKKwkJaWYgKGh3bWdyLT5j
aGlwX2lkID09IENISVBfVE9QQVopIHsKKwkJCWlmIChiYWNvX3Byb2dyYW1fcmVnaXN0ZXJzKGh3
bWdyLCBleGl0X2JhY29fdGJsX2ljZWxhbmQsCisJCQkJCQkgICBBUlJBWV9TSVpFKGV4aXRfYmFj
b190YmxfaWNlbGFuZCkpKSB7CisJCQkJaWYgKGJhY29fcHJvZ3JhbV9yZWdpc3RlcnMoaHdtZ3Is
IGNsZWFuX2JhY29fdGJsX2ljZWxhbmQsCisJCQkJCQkJICAgQVJSQVlfU0laRShjbGVhbl9iYWNv
X3RibF9pY2VsYW5kKSkpCisJCQkJCXJldHVybiAwOworCQkJfQorCQl9IGVsc2UgeworCQkJaWYg
KGJhY29fcHJvZ3JhbV9yZWdpc3RlcnMoaHdtZ3IsIGV4aXRfYmFjb190YmwsCisJCQkJCQkgICBB
UlJBWV9TSVpFKGV4aXRfYmFjb190YmwpKSkgeworCQkJCWlmIChiYWNvX3Byb2dyYW1fcmVnaXN0
ZXJzKGh3bWdyLCBjbGVhbl9iYWNvX3RibCwKKwkJCQkJCQkgICBBUlJBWV9TSVpFKGNsZWFuX2Jh
Y29fdGJsKSkpCisJCQkJCXJldHVybiAwOworCQkJfQogCQl9CiAJfQogCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
