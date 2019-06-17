Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6E49050
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E5E6E046;
	Mon, 17 Jun 2019 19:50:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730CF6E044
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:05 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so12305275qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6ZSHVH4waVY7N2S39LYMZ6wFV4w4v0EtIpDLHjiZWU=;
 b=mFZb4pE6x2S6UYwKfD60nRAxny13r+dDIRgoHNKXzkilFiK0K5ydf+oPJvtcFs35Ai
 6PDaea74sM0SsIALwX3FXvJodV17EvhEhTfetqOo2EW3dPw0bhs9CtzKi0rj7eC+z+af
 g/LRjSAATRHNInMm+mNlTcFJNaeuTS34FHLBwrz6fZORkd4YmDHWbVcxsrIQAez5x9xb
 Vwxtq1839NoQ/QV1mwqhFhmCvclXQVpH53bFujNolUFKXce6d+0bfZcmAC4z6zIN5wNL
 b8MGy747ziBOrWNoJf0ECUfElAo3RRII4AUD4OB7pOOCOuVMFRAQ7m+OPhtOMLz9wt71
 qRNA==
X-Gm-Message-State: APjAAAVMOFEZfwi0ctkmKxNhn+aDSWfssEDz3G5vbMCBQ3zVMKkChfTF
 5q1vrFktmKV7ClPTsODgqARI9pmN9B1qZA==
X-Google-Smtp-Source: APXvYqzZy5ECbowdrhKlzSl+1SPxoXM8bpxp6filhwSXAPIHLHFdyNM3OCAMCaA0cauoq1SK9Aw8MQ==
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr82260082qta.169.1560801003811; 
 Mon, 17 Jun 2019 12:50:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 408/459] drm/amd/display: DCHUB requestors numbers for Navi.
Date: Mon, 17 Jun 2019 14:48:57 -0500
Message-Id: <20190617194948.18667-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6ZSHVH4waVY7N2S39LYMZ6wFV4w4v0EtIpDLHjiZWU=;
 b=eAVI1A1gHD2UQxewhQZmb/REwD3WNOzlXRNHMKD9UeqBv7Q9nOoVsDejBk3ec2LQ4Y
 vk7RKbbKpAiKeSHJr4S0JYEPdIkWlgKJ44L7hstKEk90vpnhNf0+LXJjf6m+VKmexWn3
 +K+w7YjU5t2Su/x9po0CeMomp89sAgHvQ2qyDwCgbsHxF0g0MKVjNa38yS7rsohddIak
 pc1lEBUhFdSgf9uz0s598XtSz+1o6KDf2mzGvwgfuw2XTCThISYJx9/uIn5Ul46E+HE8
 02beefLN1qr/LmxWpD1QqEIYrDNzZLDhNhTMXVsI/zEUTWlsgtLfFqATISNzugT0o708
 zP2g==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKW1doeV0KVGhlIERD
SHViIGFyYml0ZXIgaGFzIGEgbWVjaGFuaXNtIHRvIGR5bmFtaWNhbGx5IHJhdGUgbGltaXQgdGhl
IERDSHViCnJlcXVlc3Qgc3RyZWFtIHRvIHRoZSBmYWJyaWMuIElmIHRoZSBtZW1vcnkgY29udHJv
bGxlciBpcyBmdWxseSB1dGlsaXplZAphbmQgdGhlIERDSHViIHJlcXVlc3RvcnMgYXJlIHdlbGwg
YWhlYWQgb2YgdGhlaXIgYW1vcnRpemVkIHNjaGVkdWxlLAp0aGVuIGl0IGlzIHNhZmUgdG8gcHJl
dmVudCB0aGUgbmV4dCB3aW5uZXIgZnJvbSBiZWluZyBjb21taXR0ZWQgYW5kIHNlbnQKdG8gdGhl
IGZhYnJpYy4gVGhlIHV0aWxpemF0aW9uIG9mIHRoZSBtZW1vcnkgY29udHJvbGxlciBpcyBhcHBy
b3hpbWF0ZWQKYnkgZW5zdXJpbmcgdGhhdCB0aGUgbnVtYmVyIG9mIG91dHN0YW5kaW5nIHJlcXVl
c3RzIGlzIGdyZWF0ZXIgdGhhbiBhCnRocmVzaG9sZCBzcGVjaWZpZWQgYnkgdGhlIEFSQl9NSU5f
UkVRX09VVFNUQU5ESU5HLiBUbyBkZXRlcm1pbmUgdGhhdAp0aGUgRENIdWIgcmVxdWVzdG9ycyBh
cmUgd2VsbCBhaGVhZCBvZiB0aGUgYW1vcnRpemVkIHNjaGVkdWxlLCB0aGUgc2xhY2sKb2YgdGhl
IG5leHQgd2lubmVyIGlzIGNvbXBhcmVkIHdpdGggdGhlIEFSQl9TQVRfTEVWRUwgaW4gRExHIFJl
ZkNsawpjeWNsZXMuCgpbSG93XQpUaGUgcmVjb21tZW5kZWQgc2V0dGluZ3MgdG8gZW5hYmxlIHRo
aXNlIGR5bmFtaWMgbGltaXRpbmcgZm9yIE5hdmkgaXMKMTgwIHJlcXVlc3RzLgoKU2lnbmVkLW9m
Zi1ieTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgpSZXZpZXdlZC1ieTog
VG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFr
aGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2h1YmJ1Yi5jICAgfCAyNCArKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJidWIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJidWIuYwppbmRleCBkNjcw
NWI0MGE1N2MuLmE4NTE1NzRmMTE4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJidWIuYwpAQCAtNDkzLDYgKzQ5MywyOCBAQCB2b2lk
IGh1YmJ1YjJfZ2V0X2RjaHViX3JlZl9mcmVxKHN0cnVjdCBodWJidWIgKmh1YmJ1YiwKIAl9CiB9
CiAKK3N0YXRpYyB2b2lkIGh1YmJ1YjJfcHJvZ3JhbV93YXRlcm1hcmtzKAorCQlzdHJ1Y3QgaHVi
YnViICpodWJidWIsCisJCXN0cnVjdCBkY25fd2F0ZXJtYXJrX3NldCAqd2F0ZXJtYXJrcywKKwkJ
dW5zaWduZWQgaW50IHJlZmNsa19taHosCisJCWJvb2wgc2FmZV90b19sb3dlcikKK3sKKwlzdHJ1
Y3QgZGNuMjBfaHViYnViICpodWJidWIxID0gVE9fRENOMjBfSFVCQlVCKGh1YmJ1Yik7CisJLyoK
KwkgKiBOZWVkIHRvIGNsYW1wIHRvIG1heCBvZiB0aGUgcmVnaXN0ZXIgdmFsdWVzIChpLmUuIG5v
IHdyYXApCisJICogZm9yIGRjbjEsIGFsbCB3bSByZWdpc3RlcnMgYXJlIDIxLWJpdCB3aWRlCisJ
ICovCisJaHViYnViMV9wcm9ncmFtX3VyZ2VudF93YXRlcm1hcmtzKGh1YmJ1Yiwgd2F0ZXJtYXJr
cywgcmVmY2xrX21oeiwgc2FmZV90b19sb3dlcik7CisJaHViYnViMV9wcm9ncmFtX3N0dXR0ZXJf
d2F0ZXJtYXJrcyhodWJidWIsIHdhdGVybWFya3MsIHJlZmNsa19taHosIHNhZmVfdG9fbG93ZXIp
OworCWh1YmJ1YjFfcHJvZ3JhbV9wc3RhdGVfd2F0ZXJtYXJrcyhodWJidWIsIHdhdGVybWFya3Ms
IHJlZmNsa19taHosIHNhZmVfdG9fbG93ZXIpOworCisJUkVHX1NFVChEQ0hVQkJVQl9BUkJfU0FU
X0xFVkVMLCAwLAorCQkJRENIVUJCVUJfQVJCX1NBVF9MRVZFTCwgNjAgKiByZWZjbGtfbWh6KTsK
KwlSRUdfVVBEQVRFKERDSFVCQlVCX0FSQl9ERl9SRVFfT1VUU1RBTkQsIERDSFVCQlVCX0FSQl9N
SU5fUkVRX09VVFNUQU5ELCAxODApOworCisJaHViYnViMV9hbGxvd19zZWxmX3JlZnJlc2hfY29u
dHJvbChodWJidWIsICFodWJidWItPmN0eC0+ZGMtPmRlYnVnLmRpc2FibGVfc3R1dHRlcik7Cit9
CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHViYnViX2Z1bmNzIGh1YmJ1YjJfZnVuY3MgPSB7CiAJ
LnVwZGF0ZV9kY2h1YiA9IGh1YmJ1YjJfdXBkYXRlX2RjaHViLAogCS5pbml0X2RjaHViID0gaHVi
YnViMl9pbml0X2RjaHViLApAQCAtNTAyLDcgKzUyNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aHViYnViX2Z1bmNzIGh1YmJ1YjJfZnVuY3MgPSB7CiAJLmdldF9kY2NfY29tcHJlc3Npb25fY2Fw
ID0gaHViYnViMl9nZXRfZGNjX2NvbXByZXNzaW9uX2NhcCwKIAkud21fcmVhZF9zdGF0ZSA9IGh1
YmJ1YjJfd21fcmVhZF9zdGF0ZSwKIAkuZ2V0X2RjaHViX3JlZl9mcmVxID0gaHViYnViMl9nZXRf
ZGNodWJfcmVmX2ZyZXEsCi0JLnByb2dyYW1fd2F0ZXJtYXJrcyA9IGh1YmJ1YjFfcHJvZ3JhbV93
YXRlcm1hcmtzLAorCS5wcm9ncmFtX3dhdGVybWFya3MgPSBodWJidWIyX3Byb2dyYW1fd2F0ZXJt
YXJrcywKIH07CiAKIHZvaWQgaHViYnViMl9jb25zdHJ1Y3Qoc3RydWN0IGRjbjIwX2h1YmJ1YiAq
aHViYnViLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
