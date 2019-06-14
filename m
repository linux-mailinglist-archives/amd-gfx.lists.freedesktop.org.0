Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6994566D
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 09:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE748899FF;
	Fri, 14 Jun 2019 07:32:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B79F892F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 00:44:56 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c11so616750qkk.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 17:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=op2+qqBk6rWtrVzX85Tdji9xbKocy11Zcttde2t5Nu8=;
 b=X2TeeEoriwgYpzBp3k3uVGxKmcEDc2r54sYRIFvFBrvaea/6pwwyW0monD3lDZDWel
 u/+kf7765hZgD/RaFBxpHgiP/FNKuvmFJZzfenqJKKHbVwXVYv/Sxye05C08YBHE4w6R
 Q1+eAGQvm67pzshCPG7JGPLmJjL3sQpjjtSzQSL2YSGJ/fkjLn7KJzgbhi2lu+Y4BxK1
 lQznLdc9tfoedyc/tRDCXZWOSbJ9sSvc1KB3gOmwvk0u5qbZREyUWlXITZRLCPzmwN8X
 4TLESmewFowP3Zcv5n7NlJ+uhQtIVanRlnXFpIadW2HJAg5nnP/srp3cZIM+nsIZTTte
 q0XQ==
X-Gm-Message-State: APjAAAXKtdzZ6KK7t5j7UZw7l2TDzPQeDYZZLteZZBAuAoCZ6F63NzsN
 5aUzJReCu8E/e4tfXrn+Tvr3BQ==
X-Google-Smtp-Source: APXvYqzHD04DoOdk3O8JWoFpyfnlVsPMz9EOodeX9LHTjciArgHYxwJEEoe/sklf3HM5JZVxOOzqsA==
X-Received: by 2002:a37:490c:: with SMTP id w12mr71905018qka.327.1560473095502; 
 Thu, 13 Jun 2019 17:44:55 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id s134sm759219qke.51.2019.06.13.17.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 17:44:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKr-0005Je-Km; Thu, 13 Jun 2019 21:44:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 02/12] mm/hmm: Use hmm_mirror not mm as an argument for
 hmm_range_register
Date: Thu, 13 Jun 2019 21:44:40 -0300
Message-Id: <20190614004450.20252-3-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614004450.20252-1-jgg@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:32:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=op2+qqBk6rWtrVzX85Tdji9xbKocy11Zcttde2t5Nu8=;
 b=D30mf9PGmOmg9I5/9g0MzWxEXedyBaWkkmnNqAl4FA9d0B5THPVVzTtCux6VHVWP76
 xPxHkBZrtAGHIjR/J+Se6HOXwAs75X6jrsndrpgNBnZ6e5GoT5vB7IpW5/KkPufHsMig
 /lKj49pcdbL5F8wiFJWjPLmrYeiEWCPItURysc/SGIc3LsiunwY9uiqrmWElrd7Qwv6Q
 mtT1IaGjA4RD5yCV1MA+3beQzN1ULDnUdoMUn+fqlk7WTzzxYo8IKqJG0BdnDdhGjwPC
 zYmW3IXzrRRtAS559siQ/AodNBiqOD7M6e4S7LJU7trsqP+0KuWPmBGt4JAQ6K2dl3hp
 FojQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKUmFscGggb2JzZXJ2ZXMg
dGhhdCBobW1fcmFuZ2VfcmVnaXN0ZXIoKSBjYW4gb25seSBiZSBjYWxsZWQgYnkgYSBkcml2ZXIK
d2hpbGUgYSBtaXJyb3IgaXMgcmVnaXN0ZXJlZC4gTWFrZSB0aGlzIGNsZWFyIGluIHRoZSBBUEkg
YnkgcGFzc2luZyBpbiB0aGUKbWlycm9yIHN0cnVjdHVyZSBhcyBhIHBhcmFtZXRlci4KClRoaXMg
YWxzbyBzaW1wbGlmaWVzIHVuZGVyc3RhbmRpbmcgdGhlIGxpZmV0aW1lIG1vZGVsIGZvciBzdHJ1
Y3QgaG1tLCBhcwp0aGUgaG1tIHBvaW50ZXIgbXVzdCBiZSB2YWxpZCBhcyBwYXJ0IG9mIGEgcmVn
aXN0ZXJlZCBtaXJyb3Igc28gYWxsIHdlCm5lZWQgaW4gaG1tX3JlZ2lzdGVyX3JhbmdlKCkgaXMg
YSBzaW1wbGUga3JlZl9nZXQuCgpTdWdnZXN0ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJl
bGxAbnZpZGlhLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpS
ZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpSZXZpZXdl
ZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpUZXN0ZWQtYnk6IFBoaWxpcCBZ
YW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgotLS0KdjIKLSBJbmNsdWRlIHRoZSBvbmVsaW5lIHBh
dGNoIHRvIG5vdXZlYXVfc3ZtLmMKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X3N2bS5jIHwgIDIgKy0KIGluY2x1ZGUvbGludXgvaG1tLmggICAgICAgICAgICAgICAgICAgfCAg
NyArKysrLS0tCiBtbS9obW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTMgKysr
Ky0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCmluZGV4IDkzZWQ0M2M0MTNm
MGJiLi44YzkyMzc0YWZjZjIyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9zdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5j
CkBAIC02NDksNyArNjQ5LDcgQEAgbm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5
ICpub3RpZnkpCiAJCXJhbmdlLnZhbHVlcyA9IG5vdXZlYXVfc3ZtX3Bmbl92YWx1ZXM7CiAJCXJh
bmdlLnBmbl9zaGlmdCA9IE5WSUZfVk1NX1BGTk1BUF9WMF9BRERSX1NISUZUOwogYWdhaW46Ci0J
CXJldCA9IGhtbV92bWFfZmF1bHQoJnJhbmdlLCB0cnVlKTsKKwkJcmV0ID0gaG1tX3ZtYV9mYXVs
dCgmc3ZtbS0+bWlycm9yLCAmcmFuZ2UsIHRydWUpOwogCQlpZiAocmV0ID09IDApIHsKIAkJCW11
dGV4X2xvY2soJnN2bW0tPm11dGV4KTsKIAkJCWlmICghaG1tX3ZtYV9yYW5nZV9kb25lKCZyYW5n
ZSkpIHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2ht
bS5oCmluZGV4IGNiMDFjZjFmYTNjMDhiLi4xZmJhNjk3OWFkZjQ2MCAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9obW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBAIC00OTYsNyArNDk2
LDcgQEAgc3RhdGljIGlubGluZSBib29sIGhtbV9taXJyb3JfbW1faXNfYWxpdmUoc3RydWN0IGht
bV9taXJyb3IgKm1pcnJvcikKICAqIFBsZWFzZSBzZWUgRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0
IGZvciBob3cgdG8gdXNlIHRoZSByYW5nZSBBUEkuCiAgKi8KIGludCBobW1fcmFuZ2VfcmVnaXN0
ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCi0JCSAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwKKwkJICAgICAgIHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsCiAJCSAgICAgICB1bnNpZ25l
ZCBsb25nIHN0YXJ0LAogCQkgICAgICAgdW5zaWduZWQgbG9uZyBlbmQsCiAJCSAgICAgICB1bnNp
Z25lZCBwYWdlX3NoaWZ0KTsKQEAgLTUzMiw3ICs1MzIsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
aG1tX3ZtYV9yYW5nZV9kb25lKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogfQogCiAvKiBUaGlz
IGlzIGEgdGVtcG9yYXJ5IGhlbHBlciB0byBhdm9pZCBtZXJnZSBjb25mbGljdCBiZXR3ZWVuIHRy
ZWVzLiAqLwotc3RhdGljIGlubGluZSBpbnQgaG1tX3ZtYV9mYXVsdChzdHJ1Y3QgaG1tX3Jhbmdl
ICpyYW5nZSwgYm9vbCBibG9jaykKK3N0YXRpYyBpbmxpbmUgaW50IGhtbV92bWFfZmF1bHQoc3Ry
dWN0IGhtbV9taXJyb3IgKm1pcnJvciwKKwkJCQlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgYm9v
bCBibG9jaykKIHsKIAlsb25nIHJldDsKIApAQCAtNTQ1LDcgKzU0Niw3IEBAIHN0YXRpYyBpbmxp
bmUgaW50IGhtbV92bWFfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIGJvb2wgYmxvY2sp
CiAJcmFuZ2UtPmRlZmF1bHRfZmxhZ3MgPSAwOwogCXJhbmdlLT5wZm5fZmxhZ3NfbWFzayA9IC0x
VUw7CiAKLQlyZXQgPSBobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIHJhbmdlLT52bWEtPnZtX21t
LAorCXJldCA9IGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbWlycm9yLAogCQkJCSByYW5nZS0+
c3RhcnQsIHJhbmdlLT5lbmQsCiAJCQkJIFBBR0VfU0hJRlQpOwogCWlmIChyZXQpCmRpZmYgLS1n
aXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IGY2OTU2ZDc4ZTNjYjI1Li4yMmE5N2FkYTEw
OGI0ZSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTkxNCwxMyArOTE0
LDEzIEBAIHN0YXRpYyB2b2lkIGhtbV9wZm5zX2NsZWFyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdl
LAogICogVHJhY2sgdXBkYXRlcyB0byB0aGUgQ1BVIHBhZ2UgdGFibGUgc2VlIGluY2x1ZGUvbGlu
dXgvaG1tLmgKICAqLwogaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZSwKLQkJICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAorCQkgICAgICAgc3RydWN0IGht
bV9taXJyb3IgKm1pcnJvciwKIAkJICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCSAgICAg
ICB1bnNpZ25lZCBsb25nIGVuZCwKIAkJICAgICAgIHVuc2lnbmVkIHBhZ2Vfc2hpZnQpCiB7CiAJ
dW5zaWduZWQgbG9uZyBtYXNrID0gKCgxVUwgPDwgcGFnZV9zaGlmdCkgLSAxVUwpOwotCXN0cnVj
dCBobW0gKmhtbTsKKwlzdHJ1Y3QgaG1tICpobW0gPSBtaXJyb3ItPmhtbTsKIAogCXJhbmdlLT52
YWxpZCA9IGZhbHNlOwogCXJhbmdlLT5obW0gPSBOVUxMOwpAQCAtOTM0LDIwICs5MzQsMTUgQEAg
aW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKIAlyYW5nZS0+
c3RhcnQgPSBzdGFydDsKIAlyYW5nZS0+ZW5kID0gZW5kOwogCi0JaG1tID0gaG1tX2dldF9vcl9j
cmVhdGUobW0pOwotCWlmICghaG1tKQotCQlyZXR1cm4gLUVGQVVMVDsKLQogCS8qIENoZWNrIGlm
IGhtbV9tbV9kZXN0cm95KCkgd2FzIGNhbGwuICovCi0JaWYgKGhtbS0+bW0gPT0gTlVMTCB8fCBo
bW0tPmRlYWQpIHsKLQkJaG1tX3B1dChobW0pOworCWlmIChobW0tPm1tID09IE5VTEwgfHwgaG1t
LT5kZWFkKQogCQlyZXR1cm4gLUVGQVVMVDsKLQl9CiAKIAkvKiBJbml0aWFsaXplIHJhbmdlIHRv
IHRyYWNrIENQVSBwYWdlIHRhYmxlIHVwZGF0ZXMuICovCiAJbXV0ZXhfbG9jaygmaG1tLT5sb2Nr
KTsKIAogCXJhbmdlLT5obW0gPSBobW07CisJa3JlZl9nZXQoJmhtbS0+a3JlZik7CiAJbGlzdF9h
ZGRfcmN1KCZyYW5nZS0+bGlzdCwgJmhtbS0+cmFuZ2VzKTsKIAogCS8qCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
