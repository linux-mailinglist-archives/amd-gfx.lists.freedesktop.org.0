Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AED8423B
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6AA6E5CD;
	Wed,  7 Aug 2019 02:16:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E836E58B
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 23:16:19 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r6so82200170qtt.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 16:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0FF0tXIe7rc2zq4BQfqO1Tr1iiwuQDZe0G+/mYZhPb4=;
 b=E6H/dS9yFavQTIxSwtyggW/3JO2J2kcFYHfFYAacivws12AO2JsudskjX5nlXQR5QX
 9VeGl2O2yFypGnQrYXe97bw++2ixDP7pbW1ox5sLULW/9dg0n1Nr9UgbrSOsM7ZF5SIi
 SC++1Ne9XUWBG5pR+iuh9TMfiIQJZTxbxEKQ+Ce2TgjQ3a5G4UdkPMtghOcmz5z5OP+V
 ShQW8AARkq6Y4+M3c34AWnnZ8+I8H7aWr5dRTMPD9HqJMQw8fw40HlYVpvZUdPVadFe5
 1Oaq7KM6GN0z5o13hPoL/sDephITyrc33O2WLV4n/BkUQJHQxa02tMgt4cnKQGdjhJBQ
 gR0g==
X-Gm-Message-State: APjAAAVn1WUbuNlohepBoLF6CxB62leAJRGXoizpYrXxzGm8aQKfh5pn
 EyV/gaAQBs07JBtJzz7gdEb/lQ==
X-Google-Smtp-Source: APXvYqwaqbdf4QIvkKtMVoSEHzYJbTOhZ2bib6YyUfojcuKh8v466IsdF9eIG1S+OrEDo9cDhi4cNQ==
X-Received: by 2002:aed:37e7:: with SMTP id j94mr5361848qtb.75.1565133378614; 
 Tue, 06 Aug 2019 16:16:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o21sm10387881qtc.63.2019.08.06.16.16.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 16:16:17 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv8gf-0006eA-Vd; Tue, 06 Aug 2019 20:16:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 00/11] Add mmu_notifier_get/put for managing mmu
 notifier registrations
Date: Tue,  6 Aug 2019 20:15:37 -0300
Message-Id: <20190806231548.25242-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 02:16:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0FF0tXIe7rc2zq4BQfqO1Tr1iiwuQDZe0G+/mYZhPb4=;
 b=B0RBkomh8xhiu/KwJPirnADpsgmm80iyA8oyAeS7tjmLyr6+OYlG3sTHcQnHxrHuyg
 hrEV+59BPYDAolV+0C/Qm0JvE6OUmYPhPiU/hCiW2Im2VGOJ31mcwLL+A5qQ1rCZHNwb
 x+I+HX18fZ8WcbYwPofPsca2cfe1Dd0aGLylzfF8mtyBVAM+qXmK/+UgNQi+0EQzC0Kz
 oB9X6jiIokBPaNFinF6Ry/tAJjp1AH1v6xOfZIYHJxV9CiAgZfrkjAi5u5gvTirJtxfP
 ZI1nGkw+lv9ZBWXCB3lQbrDgT2UX0s56E7c4eY7X9nbudd1m6cqGwR2I36Jj2ZjMphM1
 s7aQ==
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
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhpcyBzZXJpZXMgaW50
cm9kdWNlcyBhIG5ldyByZWdpc3RyYXRpb24gZmxvdyBmb3IgbW11X25vdGlmaWVycyBiYXNlZCBv
bgp0aGUgaWRlYSB0aGF0IHRoZSB1c2VyIHdvdWxkIGxpa2UgdG8gZ2V0IGEgc2luZ2xlIHJlZmNv
dW50ZWQgcGllY2Ugb2YKbWVtb3J5IGZvciBhIG1tLCBrZXllZCB0byBpdHMgdXNlLgoKRm9yIGlu
c3RhbmNlIG1hbnkgdXNlcnMgb2YgbW11X25vdGlmaWVycyB1c2UgYW4gaW50ZXJ2YWwgdHJlZSBv
ciBzaW1pbGFyCnRvIGRpc3BhdGNoIG5vdGlmaWNhdGlvbnMgdG8gc29tZSBvYmplY3QuIFRoZXJl
IGFyZSBtYW55IG9iamVjdHMgYnV0IG9ubHkKb25lIG5vdGlmaWVyIHN1YnNjcmlwdGlvbiBwZXIg
bW0gaG9sZGluZyB0aGUgdHJlZS4KCk9mIHRoZSAxMiBwbGFjZXMgdGhhdCBjYWxsIG1tdV9ub3Rp
Zmllcl9yZWdpc3RlcjoKIC0gNyBhcmUgbWFpbnRhaW5pbmcgc29tZSBraW5kIG9mIG9idmlvdXMg
bWFwcGluZyBvZiBtbV9zdHJ1Y3QgdG8KICAgbW11X25vdGlmaWVyIHJlZ2lzdHJhdGlvbiwgaWUg
aW4gc29tZSBsaW5rZWQgbGlzdCBvciBoYXNoIHRhYmxlLiBPZgogICB0aGUgNyB0aGlzIHNlcmll
cyBjb252ZXJ0cyA0IChncnUsIGhtbSwgUkRNQSwgcmFkZW9uKQoKIC0gMyAoaGZpMSwgZ250ZGV2
LCB2aG9zdCkgYXJlIHJlZ2lzdGVyaW5nIG11bHRpcGxlIG5vdGlmaWVycywgYnV0IGVhY2gKICAg
b25lIGltbWVkaWF0ZWx5IGRvZXMgc29tZSBWQSByYW5nZSBmaWx0ZXJpbmcsIGllIHdpdGggYW4g
aW50ZXJ2YWwgdHJlZS4KICAgVGhlc2Ugd291bGQgYmUgYmV0dGVyIHdpdGggYSBnbG9iYWwgc3Vi
c3lzdGVtLXdpZGUgcmFuZ2UgZmlsdGVyIGFuZAogICBjb3VsZCBjb252ZXJ0IHRvIHRoaXMgQVBJ
LgoKIC0gMiAoa3ZtLCBhbWRfaW9tbXUpIGFyZSBkZWxpYmVyYXRlbHkgdXNpbmcgYSBzaW5nbGUg
bW0gYXQgYSB0aW1lLCBhbmQKICAgcmVhbGx5IGNhbid0IHVzZSB0aGlzIEFQSS4gT25lIG9mIHRo
ZSBpbnRlbC1zdm0ncyBtb2RlcyBpcyBhbHNvIGluIHRoaXMKICAgbGlzdAoKVGhlIDMvNyB1bmNv
bnZlcnRlZCBkcml2ZXJzIGFyZToKIC0gaW50ZWwtc3ZtCiAgIFRoaXMgZHJpdmVyIHRyYWNrcyBt
bSdzIGluIGEgZ2xvYmFsIGxpbmtlZCBsaXN0ICdnbG9iYWxfc3ZtX2xpc3QnCiAgIGFuZCB3b3Vs
ZCBiZW5lZml0IGZyb20gdGhpcyBBUEkuCgogICBJdHMgZmxvdyBpcyBhIGJpdCBjb21wbGV4LCBz
aW5jZSBpdCBhbHNvIHdhbnRzIGEgc2V0IG9mIG5vbi1zaGFyZWQKICAgbm90aWZpZXJzLgoKIC0g
aTkxNV9nZW1fdXNycHRyCiAgIFRoaXMgZHJpdmVyIHRyYWNrcyBtbSdzIGluIGEgcGVyLWRldmlj
ZSBoYXNoCiAgIHRhYmxlIChkZXZfcHJpdi0+bW1fc3RydWN0cyksIGJ1dCBvbmx5IGhhcyBhbiBv
cHRpb25hbCB1c2Ugb2YKICAgbW11X25vdGlmaWVycy4gIFNpbmNlIGl0IHN0aWxsIHNlZW1zIHRv
IG5lZWQgdGhlIGhhc2ggdGFibGUgaXQgaXMKICAgZGlmZmljdWx0IHRvIGNvbnZlcnQuCgogLSBh
bWRrZmQva2ZkX3Byb2Nlc3MKICAgVGhpcyBkcml2ZXIgaXMgdXNpbmcgYSBnbG9iYWwgU1JDVSBo
YXNoIHRhYmxlIHRvIHRyYWNrIG1tJ3MKCiAgIFRoZSBjb250cm9sIGZsb3cgaGVyZSBpcyB2ZXJ5
IGNvbXBsaWNhdGVkIGFuZCB0aGUgZHJpdmVyIGlzIHJlbHlpbmcgb24KICAgdGhpcyBoYXNoIHRh
YmxlIHRvIGJlIGZhc3Qgb24gdGhlIGlvY3RsIHN5c2NhbGwgcGF0aC4KCiAgIEl0IHdvdWxkIGRl
ZmluaXRlbHkgYmVuZWZpdCwgYnV0IG9ubHkgaWYgdGhlIGlvY3RsIHBhdGggZGlkbid0IG5lZWQg
dG8KICAgZG8gdGhlIHNlYXJjaCBzbyBvZnRlbi4KClRoaXMgc2VyaWVzIGlzIGFscmVhZHkgZW50
YW5nbGVkIHdpdGggcGF0Y2hlcyBpbiB0aGUgaG1tICYgUkRNQSB0cmVlIGFuZAp3aWxsIHJlcXVp
cmUgc29tZSBnaXQgdG9waWMgYnJhbmNoZXMgZm9yIHRoZSBSRE1BIE9EUCBzdHVmZi4gSSBpbnRl
bmQgZm9yCml0IHRvIGdvIHRocm91Z2ggdGhlIGhtbSB0cmVlLgoKVGhlcmUgaXMgYSBnaXQgdmVy
c2lvbiBoZXJlOgoKaHR0cHM6Ly9naXRodWIuY29tL2pndW50aG9ycGUvbGludXgvY29tbWl0cy9t
bXVfbm90aWZpZXIKCldoaWNoIGhhcyB0aGUgcmVxdWlyZWQgcHJlLXBhdGNoZXMgZm9yIHRoZSBS
RE1BIE9EUCBjb252ZXJzaW9uIHRoYXQgYXJlCnN0aWxsIGJlaW5nIHJldmlld2VkLgoKSmFzb24g
R3VudGhvcnBlICgxMSk6CiAgbW0vbW11X25vdGlmaWVyczogaG9pc3QgZG9fbW11X25vdGlmaWVy
X3JlZ2lzdGVyIGRvd25fd3JpdGUgdG8gdGhlCiAgICBjYWxsZXIKICBtbS9tbXVfbm90aWZpZXJz
OiBkbyBub3Qgc3BlY3VsYXRpdmVseSBhbGxvY2F0ZSBhIG1tdV9ub3RpZmllcl9tbQogIG1tL21t
dV9ub3RpZmllcnM6IGFkZCBhIGdldC9wdXQgc2NoZW1lIGZvciB0aGUgcmVnaXN0cmF0aW9uCiAg
bWlzYy9zZ2ktZ3J1OiB1c2UgbW11X25vdGlmaWVyX2dldC9wdXQgZm9yIHN0cnVjdCBncnVfbW1f
c3RydWN0CiAgaG1tOiB1c2UgbW11X25vdGlmaWVyX2dldC9wdXQgZm9yICdzdHJ1Y3QgaG1tJwog
IFJETUEvb2RwOiB1c2UgbW11X25vdGlmaWVyX2dldC9wdXQgZm9yICdzdHJ1Y3QgaWJfdWNvbnRl
eHRfcGVyX21tJwogIFJETUEvb2RwOiByZW1vdmUgaWJfdWNvbnRleHQgZnJvbSBpYl91bWVtCiAg
ZHJtL3JhZGVvbjogdXNlIG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgcmFkZW9uX21u
CiAgZHJtL2FtZGtmZDogZml4IGEgdXNlIGFmdGVyIGZyZWUgcmFjZSB3aXRoIG1tdV9ub3RpZmVy
IHVucmVnaXN0ZXIKICBkcm0vYW1ka2ZkOiB1c2UgbW11X25vdGlmaWVyX3B1dAogIG1tL21tdV9u
b3RpZmllcnM6IHJlbW92ZSB1bnJlZ2lzdGVyX25vX3JlbGVhc2UKCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9wcml2LmggICAgfCAgIDMgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3Byb2Nlc3MuYyB8ICA4OCArKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZHJtLmMgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAgICAg
ICAgICB8ICAgMyAtCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyAgIHwg
ICAyIC0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgICAgfCAgIDIgKwog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYyAgICAgICB8IDE1NyArKysrLS0tLS0t
LS0tLS0tCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMgICAgICAgICAgIHwgICA0ICst
CiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtX29kcC5jICAgICAgIHwgMTgzICsrKysrKy0t
LS0tLS0tLS0tLQogZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jICAgICB8ICAg
MyAtCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91dmVyYnNfbWFpbi5jICAgIHwgICAxICsKIGRy
aXZlcnMvaW5maW5pYmFuZC9ody9tbHg1L21haW4uYyAgICAgICAgfCAgIDUgLQogZHJpdmVycy9t
aXNjL3NnaS1ncnUvZ3J1ZmlsZS5jICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL21pc2Mvc2dp
LWdydS9ncnV0YWJsZXMuaCAgICAgICAgIHwgICAyIC0KIGRyaXZlcnMvbWlzYy9zZ2ktZ3J1L2dy
dXRsYnB1cmdlLmMgICAgICAgfCAgODQgKysrLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2htbS5oICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEyICstCiBpbmNsdWRlL2xpbnV4L21tX3R5cGVzLmggICAg
ICAgICAgICAgICAgIHwgICA2IC0KIGluY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggICAgICAg
ICAgICAgfCAgNDAgKysrLQogaW5jbHVkZS9yZG1hL2liX3VtZW0uaCAgICAgICAgICAgICAgICAg
ICB8ICAgMiArLQogaW5jbHVkZS9yZG1hL2liX3VtZW1fb2RwLmggICAgICAgICAgICAgICB8ICAx
MCArLQogaW5jbHVkZS9yZG1hL2liX3ZlcmJzLmggICAgICAgICAgICAgICAgICB8ICAgMyAtCiBr
ZXJuZWwvZm9yay5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0KIG1tL2htbS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMjEgKysrLS0tLS0tLS0tCiBtbS9t
bXVfbm90aWZpZXIuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMjMwICsrKysrKysrKysrKysr
KysrLS0tLS0tCiAyNSBmaWxlcyBjaGFuZ2VkLCA0MDggaW5zZXJ0aW9ucygrKSwgNTU5IGRlbGV0
aW9ucygtKQoKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
