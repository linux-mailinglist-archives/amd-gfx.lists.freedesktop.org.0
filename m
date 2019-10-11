Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB75CD3750
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291746EBA4;
	Fri, 11 Oct 2019 01:46:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004376EB9A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:46:05 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id y189so7500664qkc.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pk5/wT5DAtBA+9X9zn81GYGcIFPFlQOVz6hYuvKixQg=;
 b=VI15hgL21govhD5OeRfkvIrXM/ChD9ptL+LBJXjPiX2UoFEj8aAMXKqDIE3SqS8Yrn
 lkaw5LyfMC4vTZV8uvz17Rmcm5zh8MvyAGE5JNzM7G0frefqgMjgJydOUvDztbguueH0
 o//z2Myx0bIbp1WUILXHtiFAru1h6dHJh11TNJyn8Y1cNUc+GYR2GPtm8z6e0Fsj/R2r
 l2Ml9SyWVEEvZBassbI08FBQo9+zLeE5J57CppthW/YAL8ns9BCbwApsw3SDP614ybJg
 qp3tVqB54j0ZsdyQKEFJAW/KN7Q7vic0QQwvefx4Rwf2sPPkYGlfiZTvQv1Ctq1OHn16
 Llww==
X-Gm-Message-State: APjAAAXBsSOWDZanzzXtFVHaWvjCwmQVbPoDPO449YtAKOf1X4Rs0eI0
 9LqiFs7m2scUtLm2ehos4ErYRfop
X-Google-Smtp-Source: APXvYqyyPlNUNx4j3RToNXoOcKrxfeNYsAMf8UY7Lfx6phCNm2JVYFHAlmXY15ERHz29Qilv5z+vqw==
X-Received: by 2002:a37:795:: with SMTP id 143mr12898950qkh.480.1570758364738; 
 Thu, 10 Oct 2019 18:46:04 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:46:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 18/19] ALSA: hda/hdmi - enable runtime pm for newer AMD
 display audio
Date: Thu, 10 Oct 2019 20:45:35 -0500
Message-Id: <20191011014536.10869-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pk5/wT5DAtBA+9X9zn81GYGcIFPFlQOVz6hYuvKixQg=;
 b=WmLIUQDS5AxKlBQOSLblP2WYWeYxg4UMIFJYfymIJaMbfu9UO5ZXprnSljzU3ziBpf
 yXEbnoA82TCQ4corcqHOyxxehM990M+Jv70ctUuzOtXXp4m1uqcwMLJHN7HSNPKNvaYy
 lKPZywao0vsP9mhgThMUrjL6w+eInCrt+LywQvVfcpKHRR8LN8ONG+FHk+bKmrABzMIn
 Qs4JxiImdzdg6Fpg6k+V0nZqAT6Z5R+UCaQ2kygb+KyisI/AuH99U5Lpek/hZO+xM7dN
 2l8C4oOQ6yiKnbbyJGPQ8JqzejBYyqIfNgkgHEqKehy/hbq8uaRaUwZBAcAI1oVR7iGW
 YGLw==
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

V2UgYXJlIGFibGUgdG8gcG93ZXIgZG93biB0aGUgR1BVIGFuZCBhdWRpbyB2aWEgdGhlIEdQVSBk
cml2ZXIKc28gZmxhZyB0aGVzZSBhc2ljcyBhcyBzdXBwb3J0aW5nIHJ1bnRpbWUgcG0uCgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
c291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jIGIvc291bmQvcGNpL2hk
YS9oZGFfaW50ZWwuYwppbmRleCA5YjkwMzEyZDczMTQuLjkyNWE5NTkyN2YyMCAxMDA2NDQKLS0t
IGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYworKysgYi9zb3VuZC9wY2kvaGRhL2hkYV9pbnRl
bC5jCkBAIC0yNTYyLDEzICsyNTYyLDM4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2Rldmlj
ZV9pZCBhenhfaWRzW10gPSB7CiAJeyBQQ0lfREVWSUNFKDB4MTAwMiwgMHhhYWM4KSwKIAkgIC5k
cml2ZXJfZGF0YSA9IEFaWF9EUklWRVJfQVRJSERNSV9OUyB8IEFaWF9EQ0FQU19QUkVTRVRfQVRJ
X0hETUlfTlMgfSwKIAl7IFBDSV9ERVZJQ0UoMHgxMDAyLCAweGFhZDgpLAotCSAgLmRyaXZlcl9k
YXRhID0gQVpYX0RSSVZFUl9BVElIRE1JX05TIHwgQVpYX0RDQVBTX1BSRVNFVF9BVElfSERNSV9O
UyB9LAotCXsgUENJX0RFVklDRSgweDEwMDIsIDB4YWFlOCksCi0JICAuZHJpdmVyX2RhdGEgPSBB
WlhfRFJJVkVSX0FUSUhETUlfTlMgfCBBWlhfRENBUFNfUFJFU0VUX0FUSV9IRE1JX05TIH0sCisJ
ICAuZHJpdmVyX2RhdGEgPSBBWlhfRFJJVkVSX0FUSUhETUlfTlMgfCBBWlhfRENBUFNfUFJFU0VU
X0FUSV9IRE1JX05TIHwKKwkgIEFaWF9EQ0FQU19QTV9SVU5USU1FIH0sCiAJeyBQQ0lfREVWSUNF
KDB4MTAwMiwgMHhhYWUwKSwKLQkgIC5kcml2ZXJfZGF0YSA9IEFaWF9EUklWRVJfQVRJSERNSV9O
UyB8IEFaWF9EQ0FQU19QUkVTRVRfQVRJX0hETUlfTlMgfSwKKwkgIC5kcml2ZXJfZGF0YSA9IEFa
WF9EUklWRVJfQVRJSERNSV9OUyB8IEFaWF9EQ0FQU19QUkVTRVRfQVRJX0hETUlfTlMgfAorCSAg
QVpYX0RDQVBTX1BNX1JVTlRJTUUgfSwKKwl7IFBDSV9ERVZJQ0UoMHgxMDAyLCAweGFhZTgpLAor
CSAgLmRyaXZlcl9kYXRhID0gQVpYX0RSSVZFUl9BVElIRE1JX05TIHwgQVpYX0RDQVBTX1BSRVNF
VF9BVElfSERNSV9OUyB8CisJICBBWlhfRENBUFNfUE1fUlVOVElNRSB9LAogCXsgUENJX0RFVklD
RSgweDEwMDIsIDB4YWFmMCksCi0JICAuZHJpdmVyX2RhdGEgPSBBWlhfRFJJVkVSX0FUSUhETUlf
TlMgfCBBWlhfRENBUFNfUFJFU0VUX0FUSV9IRE1JX05TIH0sCisJICAuZHJpdmVyX2RhdGEgPSBB
WlhfRFJJVkVSX0FUSUhETUlfTlMgfCBBWlhfRENBUFNfUFJFU0VUX0FUSV9IRE1JX05TIHwKKwkg
IEFaWF9EQ0FQU19QTV9SVU5USU1FIH0sCisJeyBQQ0lfREVWSUNFKDB4MTAwMiwgMHhhYWY4KSwK
KwkgIC5kcml2ZXJfZGF0YSA9IEFaWF9EUklWRVJfQVRJSERNSV9OUyB8IEFaWF9EQ0FQU19QUkVT
RVRfQVRJX0hETUlfTlMgfAorCSAgQVpYX0RDQVBTX1BNX1JVTlRJTUUgfSwKKwl7IFBDSV9ERVZJ
Q0UoMHgxMDAyLCAweGFiMDApLAorCSAgLmRyaXZlcl9kYXRhID0gQVpYX0RSSVZFUl9BVElIRE1J
X05TIHwgQVpYX0RDQVBTX1BSRVNFVF9BVElfSERNSV9OUyB8CisJICBBWlhfRENBUFNfUE1fUlVO
VElNRSB9LAorCXsgUENJX0RFVklDRSgweDEwMDIsIDB4YWIwOCksCisJICAuZHJpdmVyX2RhdGEg
PSBBWlhfRFJJVkVSX0FUSUhETUlfTlMgfCBBWlhfRENBUFNfUFJFU0VUX0FUSV9IRE1JX05TIHwK
KwkgIEFaWF9EQ0FQU19QTV9SVU5USU1FIH0sCisJeyBQQ0lfREVWSUNFKDB4MTAwMiwgMHhhYjEw
KSwKKwkgIC5kcml2ZXJfZGF0YSA9IEFaWF9EUklWRVJfQVRJSERNSV9OUyB8IEFaWF9EQ0FQU19Q
UkVTRVRfQVRJX0hETUlfTlMgfAorCSAgQVpYX0RDQVBTX1BNX1JVTlRJTUUgfSwKKwl7IFBDSV9E
RVZJQ0UoMHgxMDAyLCAweGFiMTgpLAorCSAgLmRyaXZlcl9kYXRhID0gQVpYX0RSSVZFUl9BVElI
RE1JX05TIHwgQVpYX0RDQVBTX1BSRVNFVF9BVElfSERNSV9OUyB8CisJICBBWlhfRENBUFNfUE1f
UlVOVElNRSB9LAorCXsgUENJX0RFVklDRSgweDEwMDIsIDB4YWIyMCksCisJICAuZHJpdmVyX2Rh
dGEgPSBBWlhfRFJJVkVSX0FUSUhETUlfTlMgfCBBWlhfRENBUFNfUFJFU0VUX0FUSV9IRE1JX05T
IHwKKwkgIEFaWF9EQ0FQU19QTV9SVU5USU1FIH0sCisJeyBQQ0lfREVWSUNFKDB4MTAwMiwgMHhh
YjM4KSwKKwkgIC5kcml2ZXJfZGF0YSA9IEFaWF9EUklWRVJfQVRJSERNSV9OUyB8IEFaWF9EQ0FQ
U19QUkVTRVRfQVRJX0hETUlfTlMgfAorCSAgQVpYX0RDQVBTX1BNX1JVTlRJTUUgfSwKIAkvKiBW
SUEgVlQ4MjUxL1ZUODIzN0EgKi8KIAl7IFBDSV9ERVZJQ0UoMHgxMTA2LCAweDMyODgpLCAuZHJp
dmVyX2RhdGEgPSBBWlhfRFJJVkVSX1ZJQSB9LAogCS8qIFZJQSBHRlggVlQ3MTIyL1ZYOTAwICov
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
