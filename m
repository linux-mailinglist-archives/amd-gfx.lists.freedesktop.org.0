Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E012DCC7
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 14:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A5F6E0D7;
	Wed, 29 May 2019 12:27:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60ED6E0D7;
 Wed, 29 May 2019 12:27:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d9so1670328wrx.0;
 Wed, 29 May 2019 05:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dp2wkZaiPTYxjNsl5sxS75clf9uY0c9hqxZ9Pb7KMbo=;
 b=J/JxwcdpWTHDIBVVH8e2ZBtg6bpjftBpgB3G9FsQ82OmlaQvAn3SpsgJYvFhN+1aCK
 xql9sYz9ep99L5CmfvRIpv+VnJbRM6SBLqKhPBqRzAt8gZTD78ls62YRbPNsvtfR9bFj
 PWcXwhPJQ8nO3xIBuvhzKegD/rRJldW11uOQ77EdB2b9t6osr4NgXyHsv/9AFzPkOLL8
 2nDPbSWIxDGKqIxWQdYxeiayXVLw5lrlaYIxcbuASOWJbXsN4TWbJhFIz5qGFXehNLSH
 wr1DI5nPamF9BH2OjHqukd4ISRn34R0Op8ylR59bk+QIwpCvdEfrWYwOqXdgNCoP/aWw
 rBgQ==
X-Gm-Message-State: APjAAAWCCoEM9DSxaCUC+sRDsCrr9tT8Ufr/x1jmGuHuAy3ZIHkvVm0k
 WnDoFklwkatgBGZP3JUNMLT+jAR/
X-Google-Smtp-Source: APXvYqxVqsHTx01HNWbvj8lY9x5MBmqaM6Jehd2o8Fq5sm0RfGE2Zc4MsLORsbygqVV0h+ASDvCcxg==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr5553045wrp.149.1559132823784; 
 Wed, 29 May 2019 05:27:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1ea:e785:ab1c:e514])
 by smtp.gmail.com with ESMTPSA id z25sm6211343wmi.5.2019.05.29.05.27.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:27:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/10] drm/ttm: Make LRU removal optional v2
Date: Wed, 29 May 2019 14:26:53 +0200
Message-Id: <20190529122702.13035-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dp2wkZaiPTYxjNsl5sxS75clf9uY0c9hqxZ9Pb7KMbo=;
 b=iEaulc0Kk0mKaP5bNBTjyvhXj5qZk1oQjl5DFWRhP+5qVo5tNNMM4G/rNLGfZ2qt+I
 yXe/e/qZZdP0N8p8VDist/kDXM7ZtdHo5GRbGd2raypxiN4eOpvbGV5ootNh01O2R5Qi
 +Lz/vp4nKCWoC+iZmnFlM86PPlNvbgtJG2J9rdh6LBt/jOSynJ59IfwQGaijLCsKngdq
 ICUz+sahcQddrt+gIyZgOzF9AUAYWlABQW9R6LjUzWfJleLP1g/TQP3RcygO2Z6gp2T/
 VHpRu0QPO5q/+BZISIgzgHBA0y5D6w1Ii1Nrm+71ReonYRBTtHHu5mRhHXChwGmTjmty
 YiKA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgYXJlIGFscmVhZHkgZG9pbmcgdGhpcyBmb3IgRE1BLWJ1ZiBpbXBvcnRzIGFuZCBhbHNvIGZv
cgphbWRncHUgVk0gQk9zIGZvciBxdWl0ZSBhIHdoaWxlIG5vdy4KCklmIHRoaXMgZG9lc24ndCBy
dW4gaW50byBhbnkgcHJvYmxlbXMgd2UgYXJlIHByb2JhYmx5IGdvaW5nCnRvIHN0b3AgcmVtb3Zp
bmcgQk9zIGZyb20gdGhlIExSVSBhbHRvZ2V0aGVyLgoKdjI6IGRyb3AgQlVHX09OIGZyb20gdHRt
X2JvX2FkZF90b19scnUKClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYyAgfCAgOSArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2NzLmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jc2EuYyAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9yZWxlYXNlLmMg
ICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMg
ICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5j
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgICAgICAg
ICAgICAgfCAyMyArKysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9l
eGVjYnVmX3V0aWwuYyAgICAgICAgfCAyMCArKysrKysrKystLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfcmVzb3VyY2UuYyAgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF92YWxpZGF0aW9uLmggICAgfCAgMiArLQogaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19kcml2ZXIuaCAgICAgICAgICAgICAgIHwgIDUgKysrLQogaW5jbHVkZS9kcm0vdHRtL3R0
bV9leGVjYnVmX3V0aWwuaCAgICAgICAgICAgIHwgIDMgKystCiAxNCBmaWxlcyBjaGFuZ2VkLCA0
NiBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKaW5kZXggZTFjYWU0YTM3MTEzLi42NDdl
MThmOWUxMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ3B1dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMKQEAgLTU3NCw3ICs1NzQsNyBAQCBzdGF0aWMgaW50IHJlc2VydmVfYm9fYW5k
X3ZtKHN0cnVjdCBrZ2RfbWVtICptZW0sCiAJYW1kZ3B1X3ZtX2dldF9wZF9ibyh2bSwgJmN0eC0+
bGlzdCwgJmN0eC0+dm1fcGRbMF0pOwogCiAJcmV0ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygm
Y3R4LT50aWNrZXQsICZjdHgtPmxpc3QsCi0JCQkJICAgICBmYWxzZSwgJmN0eC0+ZHVwbGljYXRl
cyk7CisJCQkJICAgICBmYWxzZSwgJmN0eC0+ZHVwbGljYXRlcywgdHJ1ZSk7CiAJaWYgKCFyZXQp
CiAJCWN0eC0+cmVzZXJ2ZWQgPSB0cnVlOwogCWVsc2UgewpAQCAtNjQ3LDcgKzY0Nyw3IEBAIHN0
YXRpYyBpbnQgcmVzZXJ2ZV9ib19hbmRfY29uZF92bXMoc3RydWN0IGtnZF9tZW0gKm1lbSwKIAl9
CiAKIAlyZXQgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZjdHgtPnRpY2tldCwgJmN0eC0+bGlz
dCwKLQkJCQkgICAgIGZhbHNlLCAmY3R4LT5kdXBsaWNhdGVzKTsKKwkJCQkgICAgIGZhbHNlLCAm
Y3R4LT5kdXBsaWNhdGVzLCB0cnVlKTsKIAlpZiAoIXJldCkKIAkJY3R4LT5yZXNlcnZlZCA9IHRy
dWU7CiAJZWxzZQpAQCAtMTgwMCw3ICsxODAwLDggQEAgc3RhdGljIGludCB2YWxpZGF0ZV9pbnZh
bGlkX3VzZXJfcGFnZXMoc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbykK
IAl9CiAKIAkvKiBSZXNlcnZlIGFsbCBCT3MgYW5kIHBhZ2UgdGFibGVzIGZvciB2YWxpZGF0aW9u
ICovCi0JcmV0ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAmcmVzdl9saXN0LCBm
YWxzZSwgJmR1cGxpY2F0ZXMpOworCXJldCA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tl
dCwgJnJlc3ZfbGlzdCwgZmFsc2UsICZkdXBsaWNhdGVzLAorCQkJCSAgICAgdHJ1ZSk7CiAJV0FS
TighbGlzdF9lbXB0eSgmZHVwbGljYXRlcyksICJEdXBsaWNhdGVzIHNob3VsZCBiZSBlbXB0eSIp
OwogCWlmIChyZXQpCiAJCWdvdG8gb3V0X2ZyZWU7CkBAIC0yMDA2LDcgKzIwMDcsNyBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF9ncHV2bV9yZXN0b3JlX3Byb2Nlc3NfYm9zKHZvaWQgKmluZm8sIHN0cnVj
dCBkbWFfZmVuY2UgKiplZikKIAl9CiAKIAlyZXQgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZj
dHgudGlja2V0LCAmY3R4Lmxpc3QsCi0JCQkJICAgICBmYWxzZSwgJmR1cGxpY2F0ZV9zYXZlKTsK
KwkJCQkgICAgIGZhbHNlLCAmZHVwbGljYXRlX3NhdmUsIHRydWUpOwogCWlmIChyZXQpIHsKIAkJ
cHJfZGVidWcoIk1lbW9yeSBldmljdGlvbjogVFRNIFJlc2VydmUgRmFpbGVkLiBUcnkgYWdhaW5c
biIpOwogCQlnb3RvIHR0bV9yZXNlcnZlX2ZhaWw7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jCmluZGV4IGQ3MmNjNTgzZWJkMS4uZmZmNTU4Y2YzODViIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAtNjQ4LDcgKzY0OCw3IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2NzX3BhcnNlcl9ib3Moc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJfQogCiAJ
ciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgdHJ1
ZSwKLQkJCQkgICAmZHVwbGljYXRlcyk7CisJCQkJICAgJmR1cGxpY2F0ZXMsIHRydWUpOwogCWlm
ICh1bmxpa2VseShyICE9IDApKSB7CiAJCWlmIChyICE9IC1FUkVTVEFSVFNZUykKIAkJCURSTV9F
UlJPUigidHRtX2V1X3Jlc2VydmVfYnVmZmVycyBmYWlsZWQuXG4iKTsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jc2EuYwppbmRleCA1NGRkMDJhODk4YjkuLjA2ZjgzY2FjMGQzYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYwpAQCAtNzksNyArNzksNyBA
QCBpbnQgYW1kZ3B1X21hcF9zdGF0aWNfY3NhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKIAlsaXN0X2FkZCgmY3NhX3R2LmhlYWQsICZsaXN0KTsKIAlh
bWRncHVfdm1fZ2V0X3BkX2JvKHZtLCAmbGlzdCwgJnBkKTsKIAotCXIgPSB0dG1fZXVfcmVzZXJ2
ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCB0cnVlLCBOVUxMKTsKKwlyID0gdHRtX2V1X3Jlc2Vy
dmVfYnVmZmVycygmdGlja2V0LCAmbGlzdCwgdHJ1ZSwgTlVMTCwgdHJ1ZSk7CiAJaWYgKHIpIHsK
IAkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gcmVzZXJ2ZSBDU0EsUEQgQk9zOiBlcnI9JWRcbiIsIHIp
OwogCQlyZXR1cm4gcjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwppbmRl
eCA3Yjg0MDM2NzAwNGMuLmQ1MTNhNWFkMDNkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZW0uYwpAQCAtMTcxLDcgKzE3MSw3IEBAIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3Rf
Y2xvc2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAKIAlhbWRncHVfdm1fZ2V0X3BkX2Jv
KHZtLCAmbGlzdCwgJnZtX3BkKTsKIAotCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNr
ZXQsICZsaXN0LCBmYWxzZSwgJmR1cGxpY2F0ZXMpOworCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZm
ZXJzKCZ0aWNrZXQsICZsaXN0LCBmYWxzZSwgJmR1cGxpY2F0ZXMsIHRydWUpOwogCWlmIChyKSB7
CiAJCWRldl9lcnIoYWRldi0+ZGV2LCAibGVha2luZyBibyB2YSBiZWNhdXNlICIKIAkJCSJ3ZSBm
YWlsIHRvIHJlc2VydmUgYm8gKCVkKVxuIiwgcik7CkBAIC02MDgsNyArNjA4LDcgQEAgaW50IGFt
ZGdwdV9nZW1fdmFfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAog
CWFtZGdwdV92bV9nZXRfcGRfYm8oJmZwcml2LT52bSwgJmxpc3QsICZ2bV9wZCk7CiAKLQlyID0g
dHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAmbGlzdCwgdHJ1ZSwgJmR1cGxpY2F0ZXMp
OworCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCB0cnVlLCAmZHVw
bGljYXRlcywgdHJ1ZSk7CiAJaWYgKHIpCiAJCWdvdG8gZXJyb3JfdW5yZWY7CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3JlbGVhc2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX3JlbGVhc2UuYwppbmRleCAzMGY4NWYwMTMwY2IuLjQ5ZjlhOTM4NTM5MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcmVsZWFzZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX3JlbGVhc2UuYwpAQCAtMjU2LDcgKzI1Niw3IEBAIGludCBxeGxfcmVsZWFz
ZV9yZXNlcnZlX2xpc3Qoc3RydWN0IHF4bF9yZWxlYXNlICpyZWxlYXNlLCBib29sIG5vX2ludHIp
CiAJCXJldHVybiAwOwogCiAJcmV0ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmcmVsZWFzZS0+
dGlja2V0LCAmcmVsZWFzZS0+Ym9zLAotCQkJCSAgICAgIW5vX2ludHIsIE5VTEwpOworCQkJCSAg
ICAgIW5vX2ludHIsIE5VTEwsIHRydWUpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKaW5kZXggNDQ2MTdkZWM4MTgzLi43NDExZTY5ZTI3
MTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jCkBAIC01NTksNyArNTU5LDcgQEAg
c3RhdGljIHZvaWQgcmFkZW9uX2dlbV92YV91cGRhdGVfdm0oc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYsCiAJaWYgKCF2bV9ib3MpCiAJCXJldHVybjsKIAotCXIgPSB0dG1fZXVfcmVzZXJ2ZV9i
dWZmZXJzKCZ0aWNrZXQsICZsaXN0LCB0cnVlLCBOVUxMKTsKKwlyID0gdHRtX2V1X3Jlc2VydmVf
YnVmZmVycygmdGlja2V0LCAmbGlzdCwgdHJ1ZSwgTlVMTCwgdHJ1ZSk7CiAJaWYgKHIpCiAJCWdv
dG8gZXJyb3JfZnJlZTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwppbmRl
eCA4MzNlOTA5NzA2YTkuLjM2NjgzZGUwMzAwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fb2JqZWN0LmMKQEAgLTUzOSw3ICs1MzksNyBAQCBpbnQgcmFkZW9uX2JvX2xpc3RfdmFsaWRh
dGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCiAJdTY0IGJ5dGVzX21vdmVkX3RocmVzaG9s
ZCA9IHJhZGVvbl9ib19nZXRfdGhyZXNob2xkX2Zvcl9tb3ZlcyhyZGV2KTsKIAogCUlOSVRfTElT
VF9IRUFEKCZkdXBsaWNhdGVzKTsKLQlyID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycyh0aWNrZXQs
IGhlYWQsIHRydWUsICZkdXBsaWNhdGVzKTsKKwlyID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycyh0
aWNrZXQsIGhlYWQsIHRydWUsICZkdXBsaWNhdGVzLCB0cnVlKTsKIAlpZiAodW5saWtlbHkociAh
PSAwKSkgewogCQlyZXR1cm4gcjsKIAl9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAyODQ1ZmNlYjJm
YmQuLjA2YmJjZDI2NzliMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xNzMsMTkgKzE3MywyMCBA
QCB2b2lkIHR0bV9ib19hZGRfdG9fbHJ1KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAK
IAlyZXNlcnZhdGlvbl9vYmplY3RfYXNzZXJ0X2hlbGQoYm8tPnJlc3YpOwogCi0JaWYgKCEoYm8t
Pm1lbS5wbGFjZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkpIHsKLQkJQlVHX09OKCFsaXN0
X2VtcHR5KCZiby0+bHJ1KSk7CisJaWYgKCFsaXN0X2VtcHR5KCZiby0+bHJ1KSkKKwkJcmV0dXJu
OwogCi0JCW1hbiA9ICZiZGV2LT5tYW5bYm8tPm1lbS5tZW1fdHlwZV07Ci0JCWxpc3RfYWRkX3Rh
aWwoJmJvLT5scnUsICZtYW4tPmxydVtiby0+cHJpb3JpdHldKTsKLQkJa3JlZl9nZXQoJmJvLT5s
aXN0X2tyZWYpOworCWlmIChiby0+bWVtLnBsYWNlbWVudCAmIFRUTV9QTF9GTEFHX05PX0VWSUNU
KQorCQlyZXR1cm47CiAKLQkJaWYgKGJvLT50dG0gJiYgIShiby0+dHRtLT5wYWdlX2ZsYWdzICYK
LQkJCQkgKFRUTV9QQUdFX0ZMQUdfU0cgfCBUVE1fUEFHRV9GTEFHX1NXQVBQRUQpKSkgewotCQkJ
bGlzdF9hZGRfdGFpbCgmYm8tPnN3YXAsCi0JCQkJICAgICAgJmJkZXYtPmdsb2ItPnN3YXBfbHJ1
W2JvLT5wcmlvcml0eV0pOwotCQkJa3JlZl9nZXQoJmJvLT5saXN0X2tyZWYpOwotCQl9CisJbWFu
ID0gJmJkZXYtPm1hbltiby0+bWVtLm1lbV90eXBlXTsKKwlsaXN0X2FkZF90YWlsKCZiby0+bHJ1
LCAmbWFuLT5scnVbYm8tPnByaW9yaXR5XSk7CisJa3JlZl9nZXQoJmJvLT5saXN0X2tyZWYpOwor
CisJaWYgKGJvLT50dG0gJiYgIShiby0+dHRtLT5wYWdlX2ZsYWdzICYKKwkJCSAoVFRNX1BBR0Vf
RkxBR19TRyB8IFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCkpKSB7CisJCWxpc3RfYWRkX3RhaWwoJmJv
LT5zd2FwLCAmYmRldi0+Z2xvYi0+c3dhcF9scnVbYm8tPnByaW9yaXR5XSk7CisJCWtyZWZfZ2V0
KCZiby0+bGlzdF9rcmVmKTsKIAl9CiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib19hZGRfdG9fbHJ1
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2V4ZWNidWZfdXRpbC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZXhlY2J1Zl91dGlsLmMKaW5kZXggMDA3NWViOWEwYjUy
Li45NTdlYzM3NWE0YmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2V4ZWNi
dWZfdXRpbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2V4ZWNidWZfdXRpbC5jCkBA
IC02OSw3ICs2OSw4IEBAIHZvaWQgdHRtX2V1X2JhY2tvZmZfcmVzZXJ2YXRpb24oc3RydWN0IHd3
X2FjcXVpcmVfY3R4ICp0aWNrZXQsCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShlbnRyeSwgbGlzdCwg
aGVhZCkgewogCQlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gZW50cnktPmJvOwogCi0J
CXR0bV9ib19hZGRfdG9fbHJ1KGJvKTsKKwkJaWYgKGxpc3RfZW1wdHkoJmJvLT5scnUpKQorCQkJ
dHRtX2JvX2FkZF90b19scnUoYm8pOwogCQlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5y
ZXN2KTsKIAl9CiAJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKQEAgLTkzLDcgKzk0LDcg
QEAgRVhQT1JUX1NZTUJPTCh0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbik7CiAKIGludCB0dG1f
ZXVfcmVzZXJ2ZV9idWZmZXJzKHN0cnVjdCB3d19hY3F1aXJlX2N0eCAqdGlja2V0LAogCQkJICAg
c3RydWN0IGxpc3RfaGVhZCAqbGlzdCwgYm9vbCBpbnRyLAotCQkJICAgc3RydWN0IGxpc3RfaGVh
ZCAqZHVwcykKKwkJCSAgIHN0cnVjdCBsaXN0X2hlYWQgKmR1cHMsIGJvb2wgZGVsX2xydSkKIHsK
IAlzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYjsKIAlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZl
ciAqZW50cnk7CkBAIC0xNzIsMTEgKzE3MywxMSBAQCBpbnQgdHRtX2V1X3Jlc2VydmVfYnVmZmVy
cyhzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKnRpY2tldCwKIAkJbGlzdF9hZGQoJmVudHJ5LT5oZWFk
LCBsaXN0KTsKIAl9CiAKLQlpZiAodGlja2V0KQotCQl3d19hY3F1aXJlX2RvbmUodGlja2V0KTsK
LQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsKLQl0dG1fZXVfZGVsX2Zyb21fbHJ1X2xvY2tl
ZChsaXN0KTsKLQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOworCWlmIChkZWxfbHJ1KSB7
CisJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOworCQl0dG1fZXVfZGVsX2Zyb21fbHJ1X2xv
Y2tlZChsaXN0KTsKKwkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKKwl9CiAJcmV0dXJu
IDA7CiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMpOwpAQCAtMjAzLDcg
KzIwNCwxMCBAQCB2b2lkIHR0bV9ldV9mZW5jZV9idWZmZXJfb2JqZWN0cyhzdHJ1Y3Qgd3dfYWNx
dWlyZV9jdHggKnRpY2tldCwKIAkJCXJlc2VydmF0aW9uX29iamVjdF9hZGRfc2hhcmVkX2ZlbmNl
KGJvLT5yZXN2LCBmZW5jZSk7CiAJCWVsc2UKIAkJCXJlc2VydmF0aW9uX29iamVjdF9hZGRfZXhj
bF9mZW5jZShiby0+cmVzdiwgZmVuY2UpOwotCQl0dG1fYm9fYWRkX3RvX2xydShibyk7CisJCWlm
IChsaXN0X2VtcHR5KCZiby0+bHJ1KSkKKwkJCXR0bV9ib19hZGRfdG9fbHJ1KGJvKTsKKwkJZWxz
ZQorCQkJdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoYm8sIE5VTEwpOwogCQlyZXNlcnZhdGlvbl9v
YmplY3RfdW5sb2NrKGJvLT5yZXN2KTsKIAl9CiAJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2Nr
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKaW5kZXggMTYxYjgwZmVlNDky
Li41Y2ZmYWEyNDI1OWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCkBA
IC02Myw3ICs2Myw3IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9vYmplY3RfbGlzdF92YWxpZGF0
ZShzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKnRpY2tldCwKIAlzdHJ1Y3QgdmlydGlvX2dwdV9vYmpl
Y3QgKnFvYmo7CiAJaW50IHJldDsKIAotCXJldCA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnModGlj
a2V0LCBoZWFkLCB0cnVlLCBOVUxMKTsKKwlyZXQgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKHRp
Y2tldCwgaGVhZCwgdHJ1ZSwgTlVMTCwgdHJ1ZSk7CiAJaWYgKHJldCAhPSAwKQogCQlyZXR1cm4g
cmV0OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9yZXNvdXJj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcmVzb3VyY2UuYwppbmRleCBhN2Mz
MGU1NjdmMDkuLmQyOGNiZWRiYTBiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9y
ZXNvdXJjZS5jCkBAIC00NjUsNyArNDY1LDggQEAgdm13X3Jlc291cmNlX2NoZWNrX2J1ZmZlcihz
dHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKnRpY2tldCwKIAl2YWxfYnVmLT5ibyA9ICZyZXMtPmJhY2t1
cC0+YmFzZTsKIAl2YWxfYnVmLT5udW1fc2hhcmVkID0gMDsKIAlsaXN0X2FkZF90YWlsKCZ2YWxf
YnVmLT5oZWFkLCAmdmFsX2xpc3QpOwotCXJldCA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnModGlj
a2V0LCAmdmFsX2xpc3QsIGludGVycnVwdGlibGUsIE5VTEwpOworCXJldCA9IHR0bV9ldV9yZXNl
cnZlX2J1ZmZlcnModGlja2V0LCAmdmFsX2xpc3QsIGludGVycnVwdGlibGUsIE5VTEwsCisJCQkJ
ICAgICB0cnVlKTsKIAlpZiAodW5saWtlbHkocmV0ICE9IDApKQogCQlnb3RvIG91dF9ub19yZXNl
cnZlOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF92YWxpZGF0
aW9uLmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF92YWxpZGF0aW9uLmgKaW5kZXgg
M2IzOTZmZWE0MGQ3Li5hYzQzNWI1MWY0ZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3ZhbGlkYXRpb24uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF92YWxpZGF0aW9uLmgKQEAgLTE2NSw3ICsxNjUsNyBAQCB2bXdfdmFsaWRhdGlvbl9ib19y
ZXNlcnZlKHN0cnVjdCB2bXdfdmFsaWRhdGlvbl9jb250ZXh0ICpjdHgsCiAJCQkgIGJvb2wgaW50
cikKIHsKIAlyZXR1cm4gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmY3R4LT50aWNrZXQsICZjdHgt
PmJvX2xpc3QsIGludHIsCi0JCQkJICAgICAgTlVMTCk7CisJCQkJICAgICAgTlVMTCwgdHJ1ZSk7
CiB9CiAKIC8qKgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKaW5kZXggYzAwODM0NmMyNDAxLi5mYzBk
OTk1YWM5MGQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKKysr
IGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaApAQCAtNzY5LDcgKzc2OSwxMCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgdHRtX2JvX3VucmVzZXJ2ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvKQogewogCWlmICghKGJvLT5tZW0ucGxhY2VtZW50ICYgVFRNX1BMX0ZMQUdfTk9fRVZJ
Q1QpKSB7CiAJCXNwaW5fbG9jaygmYm8tPmJkZXYtPmdsb2ItPmxydV9sb2NrKTsKLQkJdHRtX2Jv
X2FkZF90b19scnUoYm8pOworCQlpZiAobGlzdF9lbXB0eSgmYm8tPmxydSkpCisJCQl0dG1fYm9f
YWRkX3RvX2xydShibyk7CisJCWVsc2UKKwkJCXR0bV9ib19tb3ZlX3RvX2xydV90YWlsKGJvLCBO
VUxMKTsKIAkJc3Bpbl91bmxvY2soJmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7CiAJfQogCXJl
c2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3YpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9leGVjYnVmX3V0aWwuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZXhlY2J1Zl91
dGlsLmgKaW5kZXggNjIxNjE1ZmE3NzI4Li43ZTQ2Y2M2NzhlN2UgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fZXhlY2J1Zl91dGlsLmgKKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9l
eGVjYnVmX3V0aWwuaApAQCAtNzAsNiArNzAsNyBAQCBleHRlcm4gdm9pZCB0dG1fZXVfYmFja29m
Zl9yZXNlcnZhdGlvbihzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKnRpY2tldCwKICAqIEBsaXN0OiAg
ICB0aHJlYWQgcHJpdmF0ZSBsaXN0IG9mIHR0bV92YWxpZGF0ZV9idWZmZXIgc3RydWN0cy4KICAq
IEBpbnRyOiAgICBzaG91bGQgdGhlIHdhaXQgYmUgaW50ZXJydXB0aWJsZQogICogQGR1cHM6ICAg
IFtvdXRdIG9wdGlvbmFsIGxpc3Qgb2YgZHVwbGljYXRlcy4KKyAqIEBkZWxfbHJ1OiB0cnVlIGlm
IEJPcyBzaG91bGQgYmUgcmVtb3ZlZCBmcm9tIHRoZSBMUlUuCiAgKgogICogVHJpZXMgdG8gcmVz
ZXJ2ZSBib3MgcG9pbnRlZCB0byBieSB0aGUgbGlzdCBlbnRyaWVzIGZvciB2YWxpZGF0aW9uLgog
ICogSWYgdGhlIGZ1bmN0aW9uIHJldHVybnMgMCwgYWxsIGJ1ZmZlcnMgYXJlIG1hcmtlZCBhcyAi
dW5mZW5jZWQiLApAQCAtOTgsNyArOTksNyBAQCBleHRlcm4gdm9pZCB0dG1fZXVfYmFja29mZl9y
ZXNlcnZhdGlvbihzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKnRpY2tldCwKIAogZXh0ZXJuIGludCB0
dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKHN0cnVjdCB3d19hY3F1aXJlX2N0eCAqdGlja2V0LAogCQkJ
CSAgc3RydWN0IGxpc3RfaGVhZCAqbGlzdCwgYm9vbCBpbnRyLAotCQkJCSAgc3RydWN0IGxpc3Rf
aGVhZCAqZHVwcyk7CisJCQkJICBzdHJ1Y3QgbGlzdF9oZWFkICpkdXBzLCBib29sIGRlbF9scnUp
OwogCiAvKioKICAqIGZ1bmN0aW9uIHR0bV9ldV9mZW5jZV9idWZmZXJfb2JqZWN0cy4KLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
