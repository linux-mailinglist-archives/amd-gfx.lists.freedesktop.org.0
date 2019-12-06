Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4131156E9
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Dec 2019 19:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50AF6FA7A;
	Fri,  6 Dec 2019 18:00:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CBC6FA6F
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Dec 2019 17:33:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c14so8644312wrn.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 06 Dec 2019 09:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rpWhTX9WgPz+W3ivupwW3QtrsF5cf1IpxQZ+ZHSN0nY=;
 b=erLn6giayzNiKyCEyXUC54mnKuNfBs1dU2JnlwWb56cqSR+G9TljC5FO5jm0EZ8OO6
 IabrW/12S8WMilnq6fbkTVnhlT8NvlvbhQ3n1Np7ZAST9Tn6+qDs0yNmzV/LeWFRgr0I
 Xiu4pB1ZbOpKOas1CEjwxoYbyao8yhZGMRh1QTM1d9JRjqqqrj0xNb2OIqxquBb1td+9
 HMDe17sV8fOjAvB31wxBhkTRB30SeZolQj8w4EaqlfrRQXXlbLeXCWV/geV6YqP3uXPB
 FvRDJ8VqVPyIQ3o0LEXQSp8e40ZNiUXOzvlyDqdUFQ53kSE3nJ3VP9eZ5qQL7ZPjU2kE
 oX4w==
X-Gm-Message-State: APjAAAWURiNqhtlAzZMr0SHyEyVMLFYuyLrDHgrS2VPAszHDu01nxbpO
 pCzdAPtdui0N4J/0V5WHQfer0xNRMlSOGw==
X-Google-Smtp-Source: APXvYqysbcFAQTTGoj3CgS9ruK5vxT9IZn+HRtulpdC7Q8wEzh4auE8tNfi+hn27k8fQoCZJ4fU6Qw==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr17011675wrv.77.1575653595663; 
 Fri, 06 Dec 2019 09:33:15 -0800 (PST)
Received: from linux-f4ir.fritz.box
 (p200300C58F4B11009E92A83957331E39.dip0.t-ipconnect.de.
 [2003:c5:8f4b:1100:9e92:a839:5733:1e39])
 by smtp.gmail.com with ESMTPSA id v14sm16906912wrm.28.2019.12.06.09.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 09:33:15 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: alexander.deucher@amd.com,
	kenny.ho@amd.com,
	christian.koenig@amd.com
Subject: [PATCH 3/4] drm/amdgpu: allocate entities on demand
Date: Fri,  6 Dec 2019 18:33:03 +0100
Message-Id: <20191206173304.3025-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191206173304.3025-1-nirmoy.das@amd.com>
References: <20191206173304.3025-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 18:00:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rpWhTX9WgPz+W3ivupwW3QtrsF5cf1IpxQZ+ZHSN0nY=;
 b=Sf39+xYE6oVFsHp8r6s2+v4d2Tz1Z9cVz6byIVabQBNVSUfemuuoo18aCOBare+/FO
 WhDzLkxauH1vSV5psb6bCxDrlqNtVgJt1zkSEkGUYNr03Xlo0uylYrVuoEdAGNVhtogQ
 OsK+uac9wFwBfMo6D1Hoclzu60Dl0+xcQ+pu/AmJEI0bK0j9dG2YY52PFhmkN8I7eNP0
 NrexpuhN4M8/64c3+HcE9uZCmQWo0AyAzOFW1uhkoipc70nD+O7+AiKfLNhF+9JXcK7v
 nM5g50nKcOukuy5sa8OkAzbKUCVpFvpUievbEhVjoAnm2kDiG55dgmuMIo3Gqc5m8puU
 NltQ==
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
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHdlIHByZS1hbGxvY2F0ZSBlbnRpdGllcyBmb3IgYWxsIHRoZSBIVyBJUHMgb24K
Y29udGV4dCBjcmVhdGlvbiBhbmQgc29tZSBvZiB3aGljaCBhcmUgbWlnaHQgbmV2ZXIgYmUgdXNl
ZC4KClRoaXMgcGF0Y2ggdHJpZXMgdG8gcmVzb2x2ZSBlbnRpdHkgd2FzdGFnZSBieSBjcmVhdGlu
ZyBlbnRpdGllcwpmb3IgYSBIVyBJUCBvbmx5IHdoZW4gaXQgaXMgcmVxdWlyZWQuCgpTaWduZWQt
b2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIHwgMTc2ICsrKysrKysrKysrKystLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKyksIDc5IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwppbmRleCAxZDY4NTBhZjk5MDguLmM3
NjQzYWY4ODI3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2N0eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwpAQCAt
NjgsMTMgKzY4LDk5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9wcmlvcml0eV9wZXJtaXQoc3Ry
dWN0IGRybV9maWxlICpmaWxwLAogCXJldHVybiAtRUFDQ0VTOwogfQogCitzdGF0aWMgaW50IGFt
ZGdwdV9jdHhfaW5pdF9lbnRpdHkoc3RydWN0IGFtZGdwdV9jdHggKmN0eCwgdTMyIGh3X2lwKQor
eworCXN0cnVjdCBhbWRncHVfcmluZyAqcmluZ3NbQU1ER1BVX01BWF9SSU5HU107CisJc3RydWN0
IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZF9saXN0W0FNREdQVV9NQVhfUklOR1NdOworCXN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5hZGV2OworCXVuc2lnbmVkIG51bV9yaW5ncyA9
IDA7CisJdW5zaWduZWQgbnVtX3NjaGVkcyA9IDA7CisJdW5zaWduZWQgaSwgajsKKwlpbnQgciA9
IDA7CisKKwlzd2l0Y2ggKGh3X2lwKSB7CisJCWNhc2UgQU1ER1BVX0hXX0lQX0dGWDoKKwkJCXJp
bmdzWzBdID0gJmFkZXYtPmdmeC5nZnhfcmluZ1swXTsKKwkJCW51bV9yaW5ncyA9IDE7CisJCQli
cmVhazsKKwkJY2FzZSBBTURHUFVfSFdfSVBfQ09NUFVURToKKwkJCWZvciAoaSA9IDA7IGkgPCBh
ZGV2LT5nZngubnVtX2NvbXB1dGVfcmluZ3M7ICsraSkKKwkJCQlyaW5nc1tpXSA9ICZhZGV2LT5n
ZnguY29tcHV0ZV9yaW5nW2ldOworCQkJbnVtX3JpbmdzID0gYWRldi0+Z2Z4Lm51bV9jb21wdXRl
X3JpbmdzOworCQkJYnJlYWs7CisJCWNhc2UgQU1ER1BVX0hXX0lQX0RNQToKKwkJCWZvciAoaSA9
IDA7IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7ICsraSkKKwkJCQlyaW5nc1tpXSA9ICZh
ZGV2LT5zZG1hLmluc3RhbmNlW2ldLnJpbmc7CisJCQludW1fcmluZ3MgPSBhZGV2LT5zZG1hLm51
bV9pbnN0YW5jZXM7CisJCQlicmVhazsKKwkJY2FzZSBBTURHUFVfSFdfSVBfVVZEOgorCQkJcmlu
Z3NbMF0gPSAmYWRldi0+dXZkLmluc3RbMF0ucmluZzsKKwkJCW51bV9yaW5ncyA9IDE7CisJCQli
cmVhazsKKwkJY2FzZSBBTURHUFVfSFdfSVBfVkNFOgorCQkJcmluZ3NbMF0gPSAmYWRldi0+dmNl
LnJpbmdbMF07CisJCQludW1fcmluZ3MgPSAxOworCQkJYnJlYWs7CisJCWNhc2UgQU1ER1BVX0hX
X0lQX1VWRF9FTkM6CisJCQlyaW5nc1swXSA9ICZhZGV2LT51dmQuaW5zdFswXS5yaW5nX2VuY1sw
XTsKKwkJCW51bV9yaW5ncyA9IDE7CisJCQlicmVhazsKKwkJY2FzZSBBTURHUFVfSFdfSVBfVkNO
X0RFQzoKKwkJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX3Zjbl9pbnN0OyArK2kpIHsK
KwkJCQlpZiAoYWRldi0+dmNuLmhhcnZlc3RfY29uZmlnICYgKDEgPDwgaSkpCisJCQkJCWNvbnRp
bnVlOworCQkJCXJpbmdzW251bV9yaW5ncysrXSA9ICZhZGV2LT52Y24uaW5zdFtpXS5yaW5nX2Rl
YzsKKwkJCX0KKwkJCWJyZWFrOworCQljYXNlIEFNREdQVV9IV19JUF9WQ05fRU5DOgorCQkJZm9y
IChpID0gMDsgaSA8IGFkZXYtPnZjbi5udW1fdmNuX2luc3Q7ICsraSkgeworCQkJCWlmIChhZGV2
LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBpKSkKKwkJCQkJY29udGludWU7CisJCQkJZm9y
IChqID0gMDsgaiA8IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyArK2opCisJCQkJCXJpbmdzW251
bV9yaW5ncysrXSA9ICZhZGV2LT52Y24uaW5zdFtpXS5yaW5nX2VuY1tqXTsKKwkJCX0KKwkJCWJy
ZWFrOworCQljYXNlIEFNREdQVV9IV19JUF9WQ05fSlBFRzoKKwkJCWZvciAoaSA9IDA7IGkgPCBh
ZGV2LT5qcGVnLm51bV9qcGVnX2luc3Q7ICsraSkgeworCQkJCWlmIChhZGV2LT52Y24uaGFydmVz
dF9jb25maWcgJiAoMSA8PCBpKSkKKwkJCQkJY29udGludWU7CisJCQkJcmluZ3NbbnVtX3Jpbmdz
KytdID0gJmFkZXYtPmpwZWcuaW5zdFtpXS5yaW5nX2RlYzsKKwkJCX0KKwkJCWJyZWFrOworCX0K
KworCWZvciAoaSA9IDA7IGkgPCBudW1fcmluZ3M7ICsraSkgeworCQlpZiAoIXJpbmdzW2ldLT5h
ZGV2KQorCQkJY29udGludWU7CisKKwkJc2NoZWRfbGlzdFtudW1fc2NoZWRzKytdID0gJnJpbmdz
W2ldLT5zY2hlZDsKKwl9CisKKwlmb3IgKGkgPSAwOyBpIDwgYW1kZ3B1X2N0eF9udW1fZW50aXRp
ZXNbaHdfaXBdOyArK2kpCisJCXIgPSBkcm1fc2NoZWRfZW50aXR5X2luaXQoJmN0eC0+ZW50aXRp
ZXNbaHdfaXBdW2ldLmVudGl0eSwKKwkJCQljdHgtPmluaXRfcHJpb3JpdHksIHNjaGVkX2xpc3Qs
IG51bV9zY2hlZHMsICZjdHgtPmd1aWx0eSk7CisJaWYgKHIpCisJCWdvdG8gZXJyb3JfY2xlYW51
cF9lbnRpdGllczsKKworCWZvciAoaSA9IDA7IGkgPCBhbWRncHVfY3R4X251bV9lbnRpdGllc1to
d19pcF07ICsraSkKKwkJY3R4LT5lbnRpdGllc1tod19pcF1baV0uc2VxdWVuY2UgPSAxOworCisJ
cmV0dXJuIDA7CisKK2Vycm9yX2NsZWFudXBfZW50aXRpZXM6CisJZm9yIChpID0gMDsgaSA8IGFt
ZGdwdV9jdHhfbnVtX2VudGl0aWVzW2h3X2lwXTsgKytpKQorCQlkcm1fc2NoZWRfZW50aXR5X2Rl
c3Ryb3koJmN0eC0+ZW50aXRpZXNbaHdfaXBdW2ldLmVudGl0eSk7CisKKwlyZXR1cm4gcjsKK30K
Kwogc3RhdGljIGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAJCQkgICBlbnVtIGRybV9zY2hlZF9wcmlvcml0eSBwcmlvcml0eSwKIAkJCSAgIHN0cnVjdCBk
cm1fZmlsZSAqZmlscCwKIAkJCSAgIHN0cnVjdCBhbWRncHVfY3R4ICpjdHgpCiB7CiAJdW5zaWdu
ZWQgbnVtX2VudGl0aWVzID0gYW1kZ3B1X2N0eF90b3RhbF9udW1fZW50aXRpZXMoKTsKLQl1bnNp
Z25lZCBpLCBqLCBrOworCXVuc2lnbmVkIGk7CiAJaW50IHI7CiAKIAlpZiAocHJpb3JpdHkgPCAw
IHx8IHByaW9yaXR5ID49IERSTV9TQ0hFRF9QUklPUklUWV9NQVgpCkBAIC0xMDMsNyArMTg5LDcg
QEAgc3RhdGljIGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAJZm9yIChpID0gMDsgaSA8IG51bV9lbnRpdGllczsgKytpKSB7CiAJCXN0cnVjdCBhbWRncHVf
Y3R4X2VudGl0eSAqZW50aXR5ID0gJmN0eC0+ZW50aXRpZXNbMF1baV07CiAKLQkJZW50aXR5LT5z
ZXF1ZW5jZSA9IDE7CisJCWVudGl0eS0+c2VxdWVuY2UgPSAtMTsKIAkJZW50aXR5LT5mZW5jZXMg
PSAmY3R4LT5mZW5jZXNbYW1kZ3B1X3NjaGVkX2pvYnMgKiBpXTsKIAl9CiAJZm9yIChpID0gMTsg
aSA8IEFNREdQVV9IV19JUF9OVU07ICsraSkKQEAgLTEyMCw4NSArMjA2LDggQEAgc3RhdGljIGlu
dCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJY3R4LT5pbml0
X3ByaW9yaXR5ID0gcHJpb3JpdHk7CiAJY3R4LT5vdmVycmlkZV9wcmlvcml0eSA9IERSTV9TQ0hF
RF9QUklPUklUWV9VTlNFVDsKIAotCWZvciAoaSA9IDA7IGkgPCBBTURHUFVfSFdfSVBfTlVNOyAr
K2kpIHsKLQkJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nc1tBTURHUFVfTUFYX1JJTkdTXTsKLQkJ
c3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZF9saXN0W0FNREdQVV9NQVhfUklOR1NdOwot
CQl1bnNpZ25lZCBudW1fcmluZ3MgPSAwOwotCQl1bnNpZ25lZCBudW1fcnFzID0gMDsKLQotCQlz
d2l0Y2ggKGkpIHsKLQkJY2FzZSBBTURHUFVfSFdfSVBfR0ZYOgotCQkJcmluZ3NbMF0gPSAmYWRl
di0+Z2Z4LmdmeF9yaW5nWzBdOwotCQkJbnVtX3JpbmdzID0gMTsKLQkJCWJyZWFrOwotCQljYXNl
IEFNREdQVV9IV19JUF9DT01QVVRFOgotCQkJZm9yIChqID0gMDsgaiA8IGFkZXYtPmdmeC5udW1f
Y29tcHV0ZV9yaW5nczsgKytqKQotCQkJCXJpbmdzW2pdID0gJmFkZXYtPmdmeC5jb21wdXRlX3Jp
bmdbal07Ci0JCQludW1fcmluZ3MgPSBhZGV2LT5nZngubnVtX2NvbXB1dGVfcmluZ3M7Ci0JCQli
cmVhazsKLQkJY2FzZSBBTURHUFVfSFdfSVBfRE1BOgotCQkJZm9yIChqID0gMDsgaiA8IGFkZXYt
PnNkbWEubnVtX2luc3RhbmNlczsgKytqKQotCQkJCXJpbmdzW2pdID0gJmFkZXYtPnNkbWEuaW5z
dGFuY2Vbal0ucmluZzsKLQkJCW51bV9yaW5ncyA9IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsK
LQkJCWJyZWFrOwotCQljYXNlIEFNREdQVV9IV19JUF9VVkQ6Ci0JCQlyaW5nc1swXSA9ICZhZGV2
LT51dmQuaW5zdFswXS5yaW5nOwotCQkJbnVtX3JpbmdzID0gMTsKLQkJCWJyZWFrOwotCQljYXNl
IEFNREdQVV9IV19JUF9WQ0U6Ci0JCQlyaW5nc1swXSA9ICZhZGV2LT52Y2UucmluZ1swXTsKLQkJ
CW51bV9yaW5ncyA9IDE7Ci0JCQlicmVhazsKLQkJY2FzZSBBTURHUFVfSFdfSVBfVVZEX0VOQzoK
LQkJCXJpbmdzWzBdID0gJmFkZXYtPnV2ZC5pbnN0WzBdLnJpbmdfZW5jWzBdOwotCQkJbnVtX3Jp
bmdzID0gMTsKLQkJCWJyZWFrOwotCQljYXNlIEFNREdQVV9IV19JUF9WQ05fREVDOgotCQkJZm9y
IChqID0gMDsgaiA8IGFkZXYtPnZjbi5udW1fdmNuX2luc3Q7ICsraikgewotCQkJCWlmIChhZGV2
LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBqKSkKLQkJCQkJY29udGludWU7Ci0JCQkJcmlu
Z3NbbnVtX3JpbmdzKytdID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZGVjOwotCQkJfQotCQkJ
YnJlYWs7Ci0JCWNhc2UgQU1ER1BVX0hXX0lQX1ZDTl9FTkM6Ci0JCQlmb3IgKGogPSAwOyBqIDwg
YWRldi0+dmNuLm51bV92Y25faW5zdDsgKytqKSB7Ci0JCQkJaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0
X2NvbmZpZyAmICgxIDw8IGopKQotCQkJCQljb250aW51ZTsKLQkJCQlmb3IgKGsgPSAwOyBrIDwg
YWRldi0+dmNuLm51bV9lbmNfcmluZ3M7ICsraykKLQkJCQkJcmluZ3NbbnVtX3JpbmdzKytdID0g
JmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZW5jW2tdOwotCQkJfQotCQkJYnJlYWs7Ci0JCWNhc2Ug
QU1ER1BVX0hXX0lQX1ZDTl9KUEVHOgotCQkJZm9yIChqID0gMDsgaiA8IGFkZXYtPmpwZWcubnVt
X2pwZWdfaW5zdDsgKytqKSB7Ci0JCQkJaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgx
IDw8IGopKQotCQkJCQljb250aW51ZTsKLQkJCQlyaW5nc1tudW1fcmluZ3MrK10gPSAmYWRldi0+
anBlZy5pbnN0W2pdLnJpbmdfZGVjOwotCQkJfQotCQkJYnJlYWs7Ci0JCX0KLQotCQlmb3IgKGog
PSAwOyBqIDwgbnVtX3JpbmdzOyArK2opIHsKLQkJCWlmICghcmluZ3Nbal0tPmFkZXYpCi0JCQkJ
Y29udGludWU7Ci0KLQkJCXNjaGVkX2xpc3RbbnVtX3JxcysrXSA9ICZyaW5nc1tqXS0+c2NoZWQ7
Ci0JCX0KLQotCQlmb3IgKGogPSAwOyBqIDwgYW1kZ3B1X2N0eF9udW1fZW50aXRpZXNbaV07ICsr
aikKLQkJCXIgPSBkcm1fc2NoZWRfZW50aXR5X2luaXQoJmN0eC0+ZW50aXRpZXNbaV1bal0uZW50
aXR5LAotCQkJCQkJICBwcmlvcml0eSwgc2NoZWRfbGlzdCwKLQkJCQkJCSAgbnVtX3JxcywgJmN0
eC0+Z3VpbHR5KTsKLQkJaWYgKHIpCi0JCQlnb3RvIGVycm9yX2NsZWFudXBfZW50aXRpZXM7Ci0J
fQotCiAJcmV0dXJuIDA7CiAKLWVycm9yX2NsZWFudXBfZW50aXRpZXM6Ci0JZm9yIChpID0gMDsg
aSA8IG51bV9lbnRpdGllczsgKytpKQotCQlkcm1fc2NoZWRfZW50aXR5X2Rlc3Ryb3koJmN0eC0+
ZW50aXRpZXNbMF1baV0uZW50aXR5KTsKLQlrZnJlZShjdHgtPmVudGl0aWVzWzBdKTsKLQogZXJy
b3JfZnJlZV9mZW5jZXM6CiAJa2ZyZWUoY3R4LT5mZW5jZXMpOwogCWN0eC0+ZmVuY2VzID0gTlVM
TDsKQEAgLTIyOSw2ICsyMzgsOCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfY3R4X2Zpbmkoc3RydWN0
IGtyZWYgKnJlZikKIGludCBhbWRncHVfY3R4X2dldF9lbnRpdHkoc3RydWN0IGFtZGdwdV9jdHgg
KmN0eCwgdTMyIGh3X2lwLCB1MzIgaW5zdGFuY2UsCiAJCQkgIHUzMiByaW5nLCBzdHJ1Y3QgZHJt
X3NjaGVkX2VudGl0eSAqKmVudGl0eSkKIHsKKwlpbnQgcjsKKwogCWlmIChod19pcCA+PSBBTURH
UFVfSFdfSVBfTlVNKSB7CiAJCURSTV9FUlJPUigidW5rbm93biBIVyBJUCB0eXBlOiAlZFxuIiwg
aHdfaXApOwogCQlyZXR1cm4gLUVJTlZBTDsKQEAgLTI0NSw2ICsyNTYsMTMgQEAgaW50IGFtZGdw
dV9jdHhfZ2V0X2VudGl0eShzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4LCB1MzIgaHdfaXAsIHUzMiBp
bnN0YW5jZSwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJaWYgKGN0eC0+ZW50aXRpZXNbaHdf
aXBdW3JpbmddLnNlcXVlbmNlID09IC0xKSB7CisJCXIgPSBhbWRncHVfY3R4X2luaXRfZW50aXR5
KGN0eCwgaHdfaXApOworCisJCWlmIChyKQorCQkJcmV0dXJuIHI7CisJfQorCiAJKmVudGl0eSA9
ICZjdHgtPmVudGl0aWVzW2h3X2lwXVtyaW5nXS5lbnRpdHk7CiAJcmV0dXJuIDA7CiB9Ci0tIAoy
LjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
