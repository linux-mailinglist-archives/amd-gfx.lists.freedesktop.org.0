Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D88421E
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0AF6E595;
	Wed,  7 Aug 2019 02:16:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3CB6E580
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 23:16:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so86382238qtn.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 16:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVKrlmqRR6AzMRTw6vUYnac58BnYRqdIo83XWmjM4P0=;
 b=XG/RCrWHF1ysy33D999ZoLxWy4AA2rcgFuFNybuYayiqRKCpCfr2hid4YNDfiK6dSt
 YfNpvvvNr7LnL+mkANJk1VVJT5HnCCFLTVUC07ngb4JTYmZv/i2JHNEoxmzI9voxoMrl
 d9mi7shJYdt1lZyEL/bbV8lWVUC2C6cWfyedJu0ui0R+7/3Z5Tclz4aJ6awvRC7ZAAvj
 LSdPzFwq0FJnBdhMVZSC3cRR1UoTKo/XiJIW0Gmz3tKjxDmiDMEqaeIktoms06HNua2o
 8NnAiQoZo7b/dSlssXwTXlL/LLL1yf0XDWHDDDyLVizaUvS2GI3z4XYGpQTec4Dpmiam
 zb+w==
X-Gm-Message-State: APjAAAVFEnrd5sqog6X6/pysUuZCzbKLhpigGeaC/2kteH/cGguTus3X
 TTHVwQokUdmQSLQkMbHFubbJSA==
X-Google-Smtp-Source: APXvYqzhWOKQdmQJwz4hPX/uMgC+Ce6Qy7cZtY7qElskeP9tCAnQdyk3v8/xcYx29BbC2BJEkAyZyw==
X-Received: by 2002:ad4:4985:: with SMTP id t5mr5322961qvx.193.1565133375774; 
 Tue, 06 Aug 2019 16:16:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id e1sm42932553qtb.52.2019.08.06.16.16.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 16:16:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv8gg-0006eT-3A; Tue, 06 Aug 2019 20:16:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 03/11] mm/mmu_notifiers: add a get/put scheme for the
 registration
Date: Tue,  6 Aug 2019 20:15:40 -0300
Message-Id: <20190806231548.25242-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 02:16:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVKrlmqRR6AzMRTw6vUYnac58BnYRqdIo83XWmjM4P0=;
 b=pVg33LUAiJfK+ddVmka9bEGqbggf+ZJ/GOFvXeynM0R/aL21doedz+gpOItA6TWezc
 Co/ro2owT8ClSNxpeNKsrooka83hCNfTb/7E9HtnI9GJyCfPVFnvYPqllLrB4XRk0ZTU
 uwLnFN0f6nytZnVPbIhudGvFyDFKZimrU9or8Q27VPbwv7qiwvfNZTIKHcXqBBsIctKA
 IXDj6MqVFbWTgaWaf5k1YI0mpEdIFvgR4lJLcy6AR4U28Oh4i8XlYyhihGMMwJdfdWBA
 TvYKArEvsE/DYx3HQGC72o6o1IbPhpMX2+O0sT7sfDhCx9fYgtMGJ7djS/L6SlQkn9eK
 +rtQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTWFueSBwbGFjZXMgaW4g
dGhlIGtlcm5lbCBoYXZlIGEgZmxvdyB3aGVyZSB1c2Vyc3BhY2Ugd2lsbCBjcmVhdGUgc29tZQpv
YmplY3QgYW5kIHRoYXQgb2JqZWN0IHdpbGwgbmVlZCB0byBjb25uZWN0IHRvIHRoZSBzdWJzeXN0
ZW0ncwptbXVfbm90aWZpZXIgc3Vic2NyaXB0aW9uIGZvciB0aGUgZHVyYXRpb24gb2YgaXRzIGxp
ZmV0aW1lLgoKSW4gdGhpcyBjYXNlIHRoZSBzdWJzeXN0ZW0gaXMgdXN1YWxseSB0cmFja2luZyBt
dWx0aXBsZSBtbV9zdHJ1Y3RzIGFuZCBpdAppcyBkaWZmaWN1bHQgdG8ga2VlcCB0cmFjayBvZiB3
aGF0IHN0cnVjdCBtbXVfbm90aWZpZXIncyBoYXZlIGJlZW4KYWxsb2NhdGVkIGZvciB3aGF0IG1t
J3MuCgpTaW5jZSB0aGlzIGhhcyBiZWVuIG9wZW4gY29kZWQgaW4gYSB2YXJpZXR5IG9mIGV4Y2l0
aW5nIHdheXMsIHByb3ZpZGUgY29yZQpmdW5jdGlvbmFsaXR5IHRvIGRvIHRoaXMgc2FmZWx5LgoK
VGhpcyBhcHByb2FjaCB1c2VzIHRoZSBzdHJjdCBtbXVfbm90aWZpZXJfb3BzICogYXMgYSBrZXkg
dG8gZGV0ZXJtaW5lIGlmCnRoZSBzdWJzeXN0ZW0gaGFzIGEgbm90aWZpZXIgcmVnaXN0ZXJlZCBv
biB0aGUgbW0gb3Igbm90LiBJZiB0aGVyZSBpcyBhCnJlZ2lzdHJhdGlvbiB0aGVuIHRoZSBleGlz
dGluZyBub3RpZmllciBzdHJ1Y3QgaXMgcmV0dXJuZWQsIG90aGVyd2lzZSB0aGUKb3BzLT5hbGxv
Y19ub3RpZmllcnMoKSBpcyB1c2VkIHRvIGNyZWF0ZSBhIG5ldyBwZXItc3Vic3lzdGVtIG5vdGlm
aWVyIGZvcgp0aGUgbW0uCgpUaGUgZGVzdHJveSBzaWRlIGluY29ycG9yYXRlcyBhbiBhc3luYyBj
YWxsX3NyY3UgYmFzZWQgZGVzdHJ1Y3Rpb24gd2hpY2gKd2lsbCBhdm9pZCBidWdzIGluIHRoZSBj
YWxsZXJzIHN1Y2ggYXMgY29tbWl0IDZkN2MzY2RlOTNjMSAoIm1tL2htbTogZml4CnVzZSBhZnRl
ciBmcmVlIHdpdGggc3RydWN0IGhtbSBpbiB0aGUgbW11IG5vdGlmaWVycyIpLgoKU2luY2Ugd2Ug
YXJlIGluc2lkZSB0aGUgbW11IG5vdGlmaWVyIGNvcmUgbG9ja2luZyBpcyBmYWlybHkgc2ltcGxl
LCB0aGUKYWxsb2NhdGlvbiB1c2VzIHRoZSBzYW1lIGFwcHJvYWNoIGFzIGZvciBtbXVfbm90aWZp
ZXJfbW0sIHRoZSB3cml0ZSBzaWRlCm9mIHRoZSBtbWFwX3NlbSBtYWtlcyBldmVyeXRoaW5nIGRl
dGVybWluaXN0aWMgYW5kIHdlIG9ubHkgbmVlZCB0byBkbwpobGlzdF9hZGRfaGVhZF9yY3UoKSB1
bmRlciB0aGUgbW1fdGFrZV9hbGxfbG9ja3MoKS4gVGhlIG5ldyB1c2VycyBjb3VudAphbmQgdGhl
IGRpc2NvdmVyYWJpbGl0eSBpbiB0aGUgaGxpc3QgaXMgZnVsbHkgc2VyaWFsaXplZCBieSB0aGUK
bW11X25vdGlmaWVyX21tLT5sb2NrLgoKQ28tZGV2ZWxvcGVkLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGluZnJhZGVhZC5vcmc+ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPgotLS0KIGluY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggfCAgMzUgKysrKysr
KysKIG1tL21tdV9ub3RpZmllci5jICAgICAgICAgICAgfCAxNTYgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTg1IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaCBi
L2luY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmgKaW5kZXggYjZjMDA0YmQ5ZjZhZDkuLjMxYWE5
NzEzMTVhMTQyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCisrKyBi
L2luY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmgKQEAgLTIxMSw2ICsyMTEsMTkgQEAgc3RydWN0
IG1tdV9ub3RpZmllcl9vcHMgewogCSAqLwogCXZvaWQgKCppbnZhbGlkYXRlX3JhbmdlKShzdHJ1
Y3QgbW11X25vdGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJCQkJIHVuc2lnbmVk
IGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsKKworCS8qCisJICogVGhlc2UgY2FsbGJh
Y2tzIGFyZSB1c2VkIHdpdGggdGhlIGdldC9wdXQgaW50ZXJmYWNlIHRvIG1hbmFnZSB0aGUKKwkg
KiBsaWZldGltZSBvZiB0aGUgbW11X25vdGlmaWVyIG1lbW9yeS4gYWxsb2Nfbm90aWZpZXIoKSBy
ZXR1cm5zIGEgbmV3CisJICogbm90aWZpZXIgZm9yIHVzZSB3aXRoIHRoZSBtbS4KKwkgKgorCSAq
IGZyZWVfbm90aWZpZXIoKSBpcyBvbmx5IGNhbGxlZCBhZnRlciB0aGUgbW11X25vdGlmaWVyIGhh
cyBiZWVuCisJICogZnVsbHkgcHV0LCBjYWxscyB0byBhbnkgb3BzIGNhbGxiYWNrIGFyZSBwcmV2
ZW50ZWQgYW5kIG5vIG9wcworCSAqIGNhbGxiYWNrcyBhcmUgY3VycmVudGx5IHJ1bm5pbmcuIEl0
IGlzIGNhbGxlZCBmcm9tIGEgU1JDVSBjYWxsYmFjaworCSAqIGFuZCBjYW5ub3Qgc2xlZXAuCisJ
ICovCisJc3RydWN0IG1tdV9ub3RpZmllciAqKCphbGxvY19ub3RpZmllcikoc3RydWN0IG1tX3N0
cnVjdCAqbW0pOworCXZvaWQgKCpmcmVlX25vdGlmaWVyKShzdHJ1Y3QgbW11X25vdGlmaWVyICpt
bik7CiB9OwogCiAvKgpAQCAtMjI3LDYgKzI0MCw5IEBAIHN0cnVjdCBtbXVfbm90aWZpZXJfb3Bz
IHsKIHN0cnVjdCBtbXVfbm90aWZpZXIgewogCXN0cnVjdCBobGlzdF9ub2RlIGhsaXN0OwogCWNv
bnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfb3BzICpvcHM7CisJc3RydWN0IG1tX3N0cnVjdCAqbW07
CisJc3RydWN0IHJjdV9oZWFkIHJjdTsKKwl1bnNpZ25lZCBpbnQgdXNlcnM7CiB9OwogCiBzdGF0
aWMgaW5saW5lIGludCBtbV9oYXNfbm90aWZpZXJzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQpAQCAt
MjM0LDYgKzI1MCwyMSBAQCBzdGF0aWMgaW5saW5lIGludCBtbV9oYXNfbm90aWZpZXJzKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tKQogCXJldHVybiB1bmxpa2VseShtbS0+bW11X25vdGlmaWVyX21tKTsK
IH0KIAorc3RydWN0IG1tdV9ub3RpZmllciAqbW11X25vdGlmaWVyX2dldF9sb2NrZWQoY29uc3Qg
c3RydWN0IG1tdV9ub3RpZmllcl9vcHMgKm9wcywKKwkJCQkJICAgICBzdHJ1Y3QgbW1fc3RydWN0
ICptbSk7CitzdGF0aWMgaW5saW5lIHN0cnVjdCBtbXVfbm90aWZpZXIgKgorbW11X25vdGlmaWVy
X2dldChjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyAqb3BzLCBzdHJ1Y3QgbW1fc3RydWN0
ICptbSkKK3sKKwlzdHJ1Y3QgbW11X25vdGlmaWVyICpyZXQ7CisKKwlkb3duX3dyaXRlKCZtbS0+
bW1hcF9zZW0pOworCXJldCA9IG1tdV9ub3RpZmllcl9nZXRfbG9ja2VkKG9wcywgbW0pOworCXVw
X3dyaXRlKCZtbS0+bW1hcF9zZW0pOworCXJldHVybiByZXQ7Cit9Cit2b2lkIG1tdV9ub3RpZmll
cl9wdXQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4pOwordm9pZCBtbXVfbm90aWZpZXJfc3luY2hy
b25pemUodm9pZCk7CisKIGV4dGVybiBpbnQgbW11X25vdGlmaWVyX3JlZ2lzdGVyKHN0cnVjdCBt
bXVfbm90aWZpZXIgKm1uLAogCQkJCSBzdHJ1Y3QgbW1fc3RydWN0ICptbSk7CiBleHRlcm4gaW50
IF9fbW11X25vdGlmaWVyX3JlZ2lzdGVyKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLApAQCAtNTgx
LDYgKzYxMiwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbW11X25vdGlmaWVyX21tX2Rlc3Ryb3ko
c3RydWN0IG1tX3N0cnVjdCAqbW0pCiAjZGVmaW5lIHB1ZHBfaHVnZV9jbGVhcl9mbHVzaF9ub3Rp
ZnkgcHVkcF9odWdlX2NsZWFyX2ZsdXNoCiAjZGVmaW5lIHNldF9wdGVfYXRfbm90aWZ5IHNldF9w
dGVfYXQKIAorc3RhdGljIGlubGluZSB2b2lkIG1tdV9ub3RpZmllcl9zeW5jaHJvbml6ZSh2b2lk
KQoreworfQorCiAjZW5kaWYgLyogQ09ORklHX01NVV9OT1RJRklFUiAqLwogCiAjZW5kaWYgLyog
X0xJTlVYX01NVV9OT1RJRklFUl9IICovCmRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBi
L21tL21tdV9ub3RpZmllci5jCmluZGV4IDY5NjgxMGY2MzJhZGUxLi40YTc3MGI1MjExYjcxZCAx
MDA2NDQKLS0tIGEvbW0vbW11X25vdGlmaWVyLmMKKysrIGIvbW0vbW11X25vdGlmaWVyLmMKQEAg
LTI0OCw2ICsyNDgsOSBAQCBpbnQgX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIoc3RydWN0IG1tdV9u
b3RpZmllciAqbW4sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogCWxvY2tkZXBfYXNzZXJ0X2hlbGRf
d3JpdGUoJm1tLT5tbWFwX3NlbSk7CiAJQlVHX09OKGF0b21pY19yZWFkKCZtbS0+bW1fdXNlcnMp
IDw9IDApOwogCisJbW4tPm1tID0gbW07CisJbW4tPnVzZXJzID0gMTsKKwogCWlmICghbW0tPm1t
dV9ub3RpZmllcl9tbSkgewogCQkvKgogCQkgKiBrbWFsbG9jIGNhbm5vdCBiZSBjYWxsZWQgdW5k
ZXIgbW1fdGFrZV9hbGxfbG9ja3MoKSwgYnV0IHdlCkBAIC0yOTUsMTggKzI5OCwyNCBAQCBpbnQg
X19tbXVfbm90aWZpZXJfcmVnaXN0ZXIoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sIHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tKQogfQogRVhQT1JUX1NZTUJPTF9HUEwoX19tbXVfbm90aWZpZXJfcmVnaXN0
ZXIpOwogCi0vKgorLyoqCisgKiBtbXVfbm90aWZpZXJfcmVnaXN0ZXIgLSBSZWdpc3RlciBhIG5v
dGlmaWVyIG9uIGEgbW0KKyAqIEBtbjogVGhlIG5vdGlmaWVyIHRvIGF0dGFjaAorICogQG1tIDog
VGhlIG1tIHRvIGF0dGFjaCB0aGUgbm90aWZpZXIgdG8KKyAqCiAgKiBNdXN0IG5vdCBob2xkIG1t
YXBfc2VtIG5vciBhbnkgb3RoZXIgVk0gcmVsYXRlZCBsb2NrIHdoZW4gY2FsbGluZwogICogdGhp
cyByZWdpc3RyYXRpb24gZnVuY3Rpb24uIE11c3QgYWxzbyBlbnN1cmUgbW1fdXNlcnMgY2FuJ3Qg
Z28gZG93bgogICogdG8gemVybyB3aGlsZSB0aGlzIHJ1bnMgdG8gYXZvaWQgcmFjZXMgd2l0aCBt
bXVfbm90aWZpZXJfcmVsZWFzZSwKICAqIHNvIG1tIGhhcyB0byBiZSBjdXJyZW50LT5tbSBvciB0
aGUgbW0gc2hvdWxkIGJlIHBpbm5lZCBzYWZlbHkgc3VjaAogICogYXMgd2l0aCBnZXRfdGFza19t
bSgpLiBJZiB0aGUgbW0gaXMgbm90IGN1cnJlbnQtPm1tLCB0aGUgbW1fdXNlcnMKICAqIHBpbiBz
aG91bGQgYmUgcmVsZWFzZWQgYnkgY2FsbGluZyBtbXB1dCBhZnRlciBtbXVfbm90aWZpZXJfcmVn
aXN0ZXIKLSAqIHJldHVybnMuIG1tdV9ub3RpZmllcl91bnJlZ2lzdGVyIG11c3QgYmUgYWx3YXlz
IGNhbGxlZCB0bwotICogdW5yZWdpc3RlciB0aGUgbm90aWZpZXIuIG1tX2NvdW50IGlzIGF1dG9t
YXRpY2FsbHkgcGlubmVkIHRvIGFsbG93Ci0gKiBtbXVfbm90aWZpZXJfdW5yZWdpc3RlciB0byBz
YWZlbHkgcnVuIGF0IGFueSB0aW1lIGxhdGVyLCBiZWZvcmUgb3IKLSAqIGFmdGVyIGV4aXRfbW1h
cC4gLT5yZWxlYXNlIHdpbGwgYWx3YXlzIGJlIGNhbGxlZCBiZWZvcmUgZXhpdF9tbWFwCi0gKiBm
cmVlcyB0aGUgcGFnZXMuCisgKiByZXR1cm5zLgorICoKKyAqIG1tdV9ub3RpZmllcl91bnJlZ2lz
dGVyKCkgb3IgbW11X25vdGlmaWVyX3B1dCgpIG11c3QgYmUgYWx3YXlzIGNhbGxlZCB0bworICog
dW5yZWdpc3RlciB0aGUgbm90aWZpZXIuCisgKgorICogV2hpbGUgdGhlIGNhbGxlciBoYXMgYSBt
bXVfbm90aWZlciBnZXQgdGhlIG1tIHBvaW50ZXIgd2lsbCByZW1haW4gdmFsaWQsCisgKiBhbmQg
Y2FuIGJlIGNvbnZlcnRlZCB0byBhbiBhY3RpdmUgbW0gcG9pbnRlciB2aWEgbW1nZXRfbm90X3pl
cm8oKS4KICAqLwogaW50IG1tdV9ub3RpZmllcl9yZWdpc3RlcihzdHJ1Y3QgbW11X25vdGlmaWVy
ICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiB7CkBAIC0zMTksNiArMzI4LDcyIEBAIGludCBt
bXVfbm90aWZpZXJfcmVnaXN0ZXIoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKQogfQogRVhQT1JUX1NZTUJPTF9HUEwobW11X25vdGlmaWVyX3JlZ2lzdGVyKTsK
IAorc3RhdGljIHN0cnVjdCBtbXVfbm90aWZpZXIgKgorZmluZF9nZXRfbW11X25vdGlmaWVyKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLCBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyAqb3BzKQor
eworCXN0cnVjdCBtbXVfbm90aWZpZXIgKm1uOworCisJc3Bpbl9sb2NrKCZtbS0+bW11X25vdGlm
aWVyX21tLT5sb2NrKTsKKwlobGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UgKG1uLCAmbW0tPm1tdV9u
b3RpZmllcl9tbS0+bGlzdCwgaGxpc3QpIHsKKwkJaWYgKG1uLT5vcHMgIT0gb3BzKQorCQkJY29u
dGludWU7CisKKwkJaWYgKGxpa2VseShtbi0+dXNlcnMgIT0gVUlOVF9NQVgpKQorCQkJbW4tPnVz
ZXJzKys7CisJCWVsc2UKKwkJCW1uID0gRVJSX1BUUigtRU9WRVJGTE9XKTsKKwkJc3Bpbl91bmxv
Y2soJm1tLT5tbXVfbm90aWZpZXJfbW0tPmxvY2spOworCQlyZXR1cm4gbW47CisJfQorCXNwaW5f
dW5sb2NrKCZtbS0+bW11X25vdGlmaWVyX21tLT5sb2NrKTsKKwlyZXR1cm4gTlVMTDsKK30KKwor
LyoqCisgKiBtbXVfbm90aWZpZXJfZ2V0X2xvY2tlZCAtIFJldHVybiB0aGUgc2luZ2xlIHN0cnVj
dCBtbXVfbm90aWZpZXIgZm9yCisgKiAgICAgICAgICAgICAgICAgICAgICAgICAgIHRoZSBtbSAm
IG9wcworICogQG9wczogVGhlIG9wZXJhdGlvbnMgc3RydWN0IGJlaW5nIHN1YnNjcmliZSB3aXRo
CisgKiBAbW0gOiBUaGUgbW0gdG8gYXR0YWNoIG5vdGlmaWVycyB0b28KKyAqCisgKiBUaGlzIGZ1
bmN0aW9uIGVpdGhlciBhbGxvY2F0ZXMgYSBuZXcgbW11X25vdGlmaWVyIHZpYQorICogb3BzLT5h
bGxvY19ub3RpZmllcigpLCBvciByZXR1cm5zIGFuIGFscmVhZHkgZXhpc3Rpbmcgbm90aWZpZXIg
b24gdGhlCisgKiBsaXN0LiBUaGUgdmFsdWUgb2YgdGhlIG9wcyBwb2ludGVyIGlzIHVzZWQgdG8g
ZGV0ZXJtaW5lIHdoZW4gdHdvIG5vdGlmaWVycworICogYXJlIHRoZSBzYW1lLgorICoKKyAqIEVh
Y2ggY2FsbCB0byBtbXVfbm90aWZpZXJfZ2V0KCkgbXVzdCBiZSBwYWlyZWQgd2l0aCBhIGNhbGxl
ciB0bworICogbW11X25vdGlmaWVyX3B1dCgpLiBUaGUgY2FsbGVyIG11c3QgaG9sZCB0aGUgd3Jp
dGUgc2lkZSBvZiBtbS0+bW1hcF9zZW0uCisgKgorICogV2hpbGUgdGhlIGNhbGxlciBoYXMgYSBt
bXVfbm90aWZlciBnZXQgdGhlIG1tIHBvaW50ZXIgd2lsbCByZW1haW4gdmFsaWQsCisgKiBhbmQg
Y2FuIGJlIGNvbnZlcnRlZCB0byBhbiBhY3RpdmUgbW0gcG9pbnRlciB2aWEgbW1nZXRfbm90X3pl
cm8oKS4KKyAqLworc3RydWN0IG1tdV9ub3RpZmllciAqbW11X25vdGlmaWVyX2dldF9sb2NrZWQo
Y29uc3Qgc3RydWN0IG1tdV9ub3RpZmllcl9vcHMgKm9wcywKKwkJCQkJICAgICBzdHJ1Y3QgbW1f
c3RydWN0ICptbSkKK3sKKwlzdHJ1Y3QgbW11X25vdGlmaWVyICptbjsKKwlpbnQgcmV0OworCisJ
bG9ja2RlcF9hc3NlcnRfaGVsZF93cml0ZSgmbW0tPm1tYXBfc2VtKTsKKworCWlmIChtbS0+bW11
X25vdGlmaWVyX21tKSB7CisJCW1uID0gZmluZF9nZXRfbW11X25vdGlmaWVyKG1tLCBvcHMpOwor
CQlpZiAobW4pCisJCQlyZXR1cm4gbW47CisJfQorCisJbW4gPSBvcHMtPmFsbG9jX25vdGlmaWVy
KG1tKTsKKwlpZiAoSVNfRVJSKG1uKSkKKwkJcmV0dXJuIG1uOworCW1uLT5vcHMgPSBvcHM7CisJ
cmV0ID0gX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIobW4sIG1tKTsKKwlpZiAocmV0KQorCQlnb3Rv
IG91dF9mcmVlOworCXJldHVybiBtbjsKK291dF9mcmVlOgorCW1uLT5vcHMtPmZyZWVfbm90aWZp
ZXIobW4pOworCXJldHVybiBFUlJfUFRSKHJldCk7Cit9CitFWFBPUlRfU1lNQk9MX0dQTChtbXVf
bm90aWZpZXJfZ2V0X2xvY2tlZCk7CisKIC8qIHRoaXMgaXMgY2FsbGVkIGFmdGVyIHRoZSBsYXN0
IG1tdV9ub3RpZmllcl91bnJlZ2lzdGVyKCkgcmV0dXJuZWQgKi8KIHZvaWQgX19tbXVfbm90aWZp
ZXJfbW1fZGVzdHJveShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIHsKQEAgLTM5Nyw2ICs0NzIsNzUg
QEAgdm9pZCBtbXVfbm90aWZpZXJfdW5yZWdpc3Rlcl9ub19yZWxlYXNlKHN0cnVjdCBtbXVfbm90
aWZpZXIgKm1uLAogfQogRVhQT1JUX1NZTUJPTF9HUEwobW11X25vdGlmaWVyX3VucmVnaXN0ZXJf
bm9fcmVsZWFzZSk7CiAKK3N0YXRpYyB2b2lkIG1tdV9ub3RpZmllcl9mcmVlX3JjdShzdHJ1Y3Qg
cmN1X2hlYWQgKnJjdSkKK3sKKwlzdHJ1Y3QgbW11X25vdGlmaWVyICptbiA9IGNvbnRhaW5lcl9v
ZihyY3UsIHN0cnVjdCBtbXVfbm90aWZpZXIsIHJjdSk7CisJc3RydWN0IG1tX3N0cnVjdCAqbW0g
PSBtbi0+bW07CisKKwltbi0+b3BzLT5mcmVlX25vdGlmaWVyKG1uKTsKKwkvKiBQYWlycyB3aXRo
IHRoZSBnZXQgaW4gX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIoKSAqLworCW1tZHJvcChtbSk7Cit9
CisKKy8qKgorICogbW11X25vdGlmaWVyX3B1dCAtIFJlbGVhc2UgdGhlIHJlZmVyZW5jZSBvbiB0
aGUgbm90aWZpZXIKKyAqIEBtbjogVGhlIG5vdGlmaWVyIHRvIGFjdCBvbgorICoKKyAqIFRoaXMg
ZnVuY3Rpb24gbXVzdCBiZSBwYWlyZWQgd2l0aCBlYWNoIG1tdV9ub3RpZmllcl9nZXQoKSwgaXQg
cmVsZWFzZXMgdGhlCisgKiByZWZlcmVuY2Ugb2J0YWluZWQgYnkgdGhlIGdldC4gSWYgdGhpcyBp
cyB0aGUgbGFzdCByZWZlcmVuY2UgdGhlbiBwcm9jZXNzCisgKiB0byBmcmVlIHRoZSBub3RpZmll
ciB3aWxsIGJlIHJ1biBhc3luY2hyb25vdXNseS4KKyAqCisgKiBVbmxpa2UgbW11X25vdGlmaWVy
X3VucmVnaXN0ZXIoKSB0aGUgZ2V0L3B1dCBmbG93IG9ubHkgY2FsbHMgb3BzLT5yZWxlYXNlCisg
KiB3aGVuIHRoZSBtbV9zdHJ1Y3QgaXMgZGVzdHJveWVkLiBJbnN0ZWFkIGZyZWVfbm90aWZpZXIg
aXMgYWx3YXlzIGNhbGxlZCB0bworICogcmVsZWFzZSBhbnkgcmVzb3VyY2VzIGhlbGQgYnkgdGhl
IHVzZXIuCisgKgorICogQXMgb3BzLT5yZWxlYXNlIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIGNh
bGxlZCwgdGhlIHVzZXIgbXVzdCBlbnN1cmUgdGhhdAorICogYWxsIHNwdGVzIGFyZSBkcm9wcGVk
LCBhbmQgbm8gbmV3IHNwdGVzIGNhbiBiZSBlc3RhYmxpc2hlZCBiZWZvcmUKKyAqIG1tdV9ub3Rp
Zmllcl9wdXQoKSBpcyBjYWxsZWQuCisgKgorICogVGhpcyBmdW5jdGlvbiBjYW4gYmUgY2FsbGVk
IGZyb20gdGhlIG9wcy0+cmVsZWFzZSBjYWxsYmFjaywgaG93ZXZlciB0aGUKKyAqIGNhbGxlciBt
dXN0IHN0aWxsIGVuc3VyZSBpdCBpcyBjYWxsZWQgcGFpcndpc2Ugd2l0aCBtbXVfbm90aWZpZXJf
Z2V0KCkuCisgKgorICogTW9kdWxlcyBjYWxsaW5nIHRoaXMgZnVuY3Rpb24gbXVzdCBjYWxsIG1t
dV9ub3RpZmllcl9tb2R1bGVfdW5sb2FkKCkgaW4KKyAqIHRoZWlyIF9fZXhpdCBmdW5jdGlvbnMg
dG8gZW5zdXJlIHRoZSBhc3luYyB3b3JrIGlzIGNvbXBsZXRlZC4KKyAqLwordm9pZCBtbXVfbm90
aWZpZXJfcHV0KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uKQoreworCXN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tID0gbW4tPm1tOworCisJc3Bpbl9sb2NrKCZtbS0+bW11X25vdGlmaWVyX21tLT5sb2NrKTsK
KwlpZiAoV0FSTl9PTighbW4tPnVzZXJzKSB8fCAtLW1uLT51c2VycykKKwkJZ290byBvdXRfdW5s
b2NrOworCWhsaXN0X2RlbF9pbml0X3JjdSgmbW4tPmhsaXN0KTsKKwlzcGluX3VubG9jaygmbW0t
Pm1tdV9ub3RpZmllcl9tbS0+bG9jayk7CisKKwljYWxsX3NyY3UoJnNyY3UsICZtbi0+cmN1LCBt
bXVfbm90aWZpZXJfZnJlZV9yY3UpOworCXJldHVybjsKKworb3V0X3VubG9jazoKKwlzcGluX3Vu
bG9jaygmbW0tPm1tdV9ub3RpZmllcl9tbS0+bG9jayk7Cit9CitFWFBPUlRfU1lNQk9MX0dQTCht
bXVfbm90aWZpZXJfcHV0KTsKKworLyoqCisgKiBtbXVfbm90aWZpZXJfc3luY2hyb25pemUgLSBF
bnN1cmUgYWxsIG1tdV9ub3RpZmllcnMgYXJlIGZyZWVkCisgKgorICogVGhpcyBmdW5jdGlvbiBl
bnN1cmVzIHRoYXQgYWxsIG91dHNhbmRpbmcgYXN5bmMgU1JVIHdvcmsgZnJvbQorICogbW11X25v
dGlmaWVyX3B1dCgpIGlzIGNvbXBsZXRlZC4gQWZ0ZXIgaXQgcmV0dXJucyBhbnkgbW11X25vdGlm
aWVyX29wcworICogYXNzb2NpYXRlZCB3aXRoIGFuIHVudXNlZCBtbXVfbm90aWZpZXIgd2lsbCBu
byBsb25nZXIgYmUgY2FsbGVkLgorICoKKyAqIEJlZm9yZSB1c2luZyB0aGUgY2FsbGVyIG11c3Qg
ZW5zdXJlIHRoYXQgYWxsIG9mIGl0cyBtbXVfbm90aWZpZXJzIGhhdmUgYmVlbgorICogZnVsbHkg
cmVsZWFzZWQgdmlhIG1tdV9ub3RpZmllcl9wdXQoKS4KKyAqCisgKiBNb2R1bGVzIHVzaW5nIHRo
ZSBtbXVfbm90aWZpZXJfcHV0KCkgQVBJIHNob3VsZCBjYWxsIHRoaXMgaW4gdGhlaXIgX19leGl0
CisgKiBmdW5jdGlvbiB0byBhdm9pZCBtb2R1bGUgdW5sb2FkaW5nIHJhY2VzLgorICovCit2b2lk
IG1tdV9ub3RpZmllcl9zeW5jaHJvbml6ZSh2b2lkKQoreworCXN5bmNocm9uaXplX3NyY3UoJnNy
Y3UpOworfQorRVhQT1JUX1NZTUJPTF9HUEwobW11X25vdGlmaWVyX3N5bmNocm9uaXplKTsKKwog
Ym9vbAogbW11X25vdGlmaWVyX3JhbmdlX3VwZGF0ZV90b19yZWFkX29ubHkoY29uc3Qgc3RydWN0
IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCiB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
