Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF18D7EAE
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 20:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC196E87F;
	Tue, 15 Oct 2019 18:17:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB4D6E882
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:16:27 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q10so13004921pfl.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 11:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBrgIx0hifh9NggoSUxRvl2c/6uC1S5tDuowJEqJG40=;
 b=eXaiUBAJw+4CVf0ctjLjMIooBbR3R4WbA/tCjmRambJdjOh/7KejzjYcBV30m3c29p
 wq4nQucUOfc2M/LOKHOgrOSgMBA+fo+MMRVkeL31CEoyqc7oSTtV/Ov6vOIR0ZyVOUIP
 vt7FMNNeAuZsGPafMd365Y0g2pQOp+q1uBhg3tWgTtSaih12EsOIWBJCQJI+JWksaSri
 SKBpAz64P+7AktonWa1KL54EgXP9DekmrzEM5oyFW4vjaWM1xNlOHqyJLnM+0CBD96be
 zHryePIUUnUHj3pMX0QF+bJ4+fgm229VZNK6HLREaJfLu1gh94LPsRqenscH44nxWyat
 9M1A==
X-Gm-Message-State: APjAAAXqDnv1z6aWrEedkU19ySxkzkEx3HFS+siDz8k2LV5OAbAsJvD6
 G9Qu608bHp+BoM3kseGbjDNEoA==
X-Google-Smtp-Source: APXvYqyjfEo9wCFmNSKLzZPxrK/t8HgqE9dhiH72Gj5GoT9VOYhZwDkgJ97d1yM9RxM4iDCZzQrQLg==
X-Received: by 2002:a17:90a:1b49:: with SMTP id
 q67mr45572591pjq.115.1571163386669; 
 Tue, 15 Oct 2019 11:16:26 -0700 (PDT)
Received: from ziepe.ca ([24.114.26.129])
 by smtp.gmail.com with ESMTPSA id e10sm29803744pfh.77.2019.10.15.11.16.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Oct 2019 11:16:26 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iKRJT-0002Bh-64; Tue, 15 Oct 2019 15:12:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Date: Tue, 15 Oct 2019 15:12:27 -0300
Message-Id: <20191015181242.8343-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 18:17:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBrgIx0hifh9NggoSUxRvl2c/6uC1S5tDuowJEqJG40=;
 b=KAPCxFZWvPNR+o1eJpCr9JMke5tJjHO+Hw9Iby/usIHw8WW8yx8ZHGZo+YLoOM9xhi
 BrS9FkdxeYYQnmA3kMwjfZehr1ZJDdE2uP/FUGYcefwdm5CvnHDB4tNB5s3Ox06eDb48
 Jb/YPdSDDprVsyg72N4vSrObGc8lT0Q71qWUpRYvzaBNQqvJUtIzBrZO8hHCu0c2ClZ/
 ulJ9Do/bK44RzjeqrIB+m6ZQMpCg0ooyRecRaZlxz5NMfDyCsIdgT58tSnE8FLm534Li
 LWw6pyYULmh1oaU6vJDlSidrjUOOoruaKt4rA86DXQZttETufDew2mO/CrMUWdiSjgfY
 FyfA==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKOCBvZiB0aGUgbW11X25v
dGlmaWVyIHVzaW5nIGRyaXZlcnMgKGk5MTVfZ2VtLCByYWRlb25fbW4sIHVtZW1fb2RwLCBoZmkx
LApzY2lmX2RtYSwgdmhvc3QsIGdudGRldiwgaG1tKSBkcml2ZXJzIGFyZSB1c2luZyBhIGNvbW1v
biBwYXR0ZXJuIHdoZXJlCnRoZXkgb25seSB1c2UgaW52YWxpZGF0ZV9yYW5nZV9zdGFydC9lbmQg
YW5kIGltbWVkaWF0ZWx5IGNoZWNrIHRoZQppbnZhbGlkYXRpbmcgcmFuZ2UgYWdhaW5zdCBzb21l
IGRyaXZlciBkYXRhIHN0cnVjdHVyZSB0byB0ZWxsIGlmIHRoZQpkcml2ZXIgaXMgaW50ZXJlc3Rl
ZC4gSGFsZiBvZiB0aGVtIHVzZSBhbiBpbnRlcnZhbF90cmVlLCB0aGUgb3RoZXJzIGFyZQpzaW1w
bGUgbGluZWFyIHNlYXJjaCBsaXN0cy4KCk9mIHRoZSBvbmVzIEkgY2hlY2tlZCB0aGV5IGxhcmdl
bHkgc2VlbSB0byBoYXZlIHZhcmlvdXMga2luZHMgb2YgcmFjZXMsCmJ1Z3MgYW5kIHBvb3IgaW1w
bGVtZW50YXRpb24uIFRoaXMgaXMgYSByZXN1bHQgb2YgdGhlIGNvbXBsZXhpdHkgaW4gaG93CnRo
ZSBub3RpZmllciBpbnRlcmFjdHMgd2l0aCBnZXRfdXNlcl9wYWdlcygpLiBJdCBpcyBleHRyZW1l
bHkgZGlmZmljdWx0IHRvCnVzZSBpdCBjb3JyZWN0bHkuCgpDb25zb2xpZGF0ZSBhbGwgb2YgdGhp
cyBjb2RlIHRvZ2V0aGVyIGludG8gdGhlIGNvcmUgbW11X25vdGlmaWVyIGFuZApwcm92aWRlIGEg
bG9ja2luZyBzY2hlbWUgc2ltaWxhciB0byBobW1fbWlycm9yIHRoYXQgYWxsb3dzIHRoZSB1c2Vy
IHRvCnNhZmVseSB1c2UgZ2V0X3VzZXJfcGFnZXMoKSBhbmQgcmVsaWFibHkga25vdyBpZiB0aGUg
cGFnZSBsaXN0IHN0aWxsCm1hdGNoZXMgdGhlIG1tLgoKVGhpcyBuZXcgYXJyYW5nbWVudCBwbGF5
cyBuaWNlbHkgd2l0aCB0aGUgIWJsb2NrYWJsZSBtb2RlIGZvcgpPT00uIFNjYW5uaW5nIHRoZSBp
bnRlcnZhbCB0cmVlIGlzIGRvbmUgc3VjaCB0aGF0IHRoZSBpbnRlcnNlY3Rpb24gdGVzdAp3aWxs
IGFsd2F5cyBzdWNjZWVkLCBhbmQgc2luY2UgdGhlcmUgaXMgbm8gaW52YWxpZGF0ZV9yYW5nZV9l
bmQgZXhwb3NlZCB0bwpkcml2ZXJzIHRoZSBzY2hlbWUgc2FmZWx5IGFsbG93cyBtdWx0aXBsZSBk
cml2ZXJzIHRvIGJlIHN1YnNjcmliZWQuCgpGb3VyIHBsYWNlcyBhcmUgY29udmVydGVkIGFzIGFu
IGV4YW1wbGUgb2YgaG93IHRoZSBuZXcgQVBJIGlzIHVzZWQuCkZvdXIgYXJlIGxlZnQgZm9yIGZ1
dHVyZSBwYXRjaGVzOgogLSBpOTE1X2dlbSBoYXMgY29tcGxleCBsb2NraW5nIGFyb3VuZCBkZXN0
cnVjdGlvbiBvZiBhIHJlZ2lzdHJhdGlvbiwKICAgbmVlZHMgbW9yZSBzdHVkeQogLSBoZmkxICgy
bmQgdXNlcikgbmVlZHMgYWNjZXNzIHRvIHRoZSByYnRyZWUKIC0gc2NpZl9kbWEgaGFzIGEgY29t
cGxpY2F0ZWQgbG9naWMgZmxvdwogLSB2aG9zdCdzIG1tdSBub3RpZmllcnMgYXJlIGFscmVhZHkg
YmVpbmcgcmV3cml0dGVuCgpUaGlzIGlzIHN0aWxsIGJlaW5nIHRlc3RlZCwgYnV0IEkgZmlndXJl
ZCB0byBzZW5kIGl0IHRvIHN0YXJ0IGdldHRpbmcgaGVscApmcm9tIHRoZSB4ZW4sIGFtZCBhbmQg
aGZpIGRyaXZlcnMgd2hpY2ggSSBjYW5ub3QgdGVzdCBoZXJlLgoKSXQgd291bGQgYmUgaW50ZW5k
ZWQgZm9yIHRoZSBobW0gdHJlZS4KCkphc29uIEd1bnRob3JwZSAoMTUpOgogIG1tL21tdV9ub3Rp
ZmllcjogZGVmaW5lIHRoZSBoZWFkZXIgcHJlLXByb2Nlc3NvciBwYXJ0cyBldmVuIGlmCiAgICBk
aXNhYmxlZAogIG1tL21tdV9ub3RpZmllcjogYWRkIGFuIGludGVydmFsIHRyZWUgbm90aWZpZXIK
ICBtbS9obW06IGFsbG93IGhtbV9yYW5nZSB0byBiZSB1c2VkIHdpdGggYSBtbXVfcmFuZ2Vfbm90
aWZpZXIgb3IKICAgIGhtbV9taXJyb3IKICBtbS9obW06IGRlZmluZSB0aGUgcHJlLXByb2Nlc3Nv
ciByZWxhdGVkIHBhcnRzIG9mIGhtbS5oIGV2ZW4gaWYKICAgIGRpc2FibGVkCiAgUkRNQS9vZHA6
IFVzZSBtbXVfcmFuZ2Vfbm90aWZpZXJfaW5zZXJ0KCkKICBSRE1BL2hmaTE6IFVzZSBtbXVfcmFu
Z2Vfbm90aWZpZXJfaW5zZXQgZm9yIHVzZXJfZXhwX3JjdgogIGRybS9yYWRlb246IHVzZSBtbXVf
cmFuZ2Vfbm90aWZpZXJfaW5zZXJ0CiAgeGVuL2dudGRldjogVXNlIHNlbGVjdCBmb3IgRE1BX1NI
QVJFRF9CVUZGRVIKICB4ZW4vZ250ZGV2OiB1c2UgbW11X3JhbmdlX25vdGlmaWVyX2luc2VydAog
IG5vdXZlYXU6IHVzZSBtbXVfbm90aWZpZXIgZGlyZWN0bHkgZm9yIGludmFsaWRhdGVfcmFuZ2Vf
c3RhcnQKICBub3V2ZWF1OiB1c2UgbW11X3JhbmdlX25vdGlmaWVyIGluc3RlYWQgb2YgaG1tX21p
cnJvcgogIGRybS9hbWRncHU6IENhbGwgZmluZF92bWEgdW5kZXIgbW1hcF9zZW0KICBkcm0vYW1k
Z3B1OiBVc2UgbW11X3JhbmdlX2luc2VydCBpbnN0ZWFkIG9mIGhtbV9taXJyb3IKICBkcm0vYW1k
Z3B1OiBVc2UgbW11X3JhbmdlX25vdGlmaWVyIGluc3RlYWQgb2YgaG1tX21pcnJvcgogIG1tL2ht
bTogcmVtb3ZlIGhtbV9taXJyb3IgYW5kIHJlbGF0ZWQKCiBEb2N1bWVudGF0aW9uL3ZtL2htbS5y
c3QgICAgICAgICAgICAgICAgICAgICAgfCAxMDUgKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmggICAgICAgICAgIHwgICAyICsKIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8ICAgOSArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2NzLmMgICAgICAgIHwgIDE0ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X21uLmMgICAgICAgIHwgNDQ1ICsrLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfbW4uaCAgICAgICAgfCAgNTMgLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCAgICB8ICAxMyArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgICAgIHwgMTExICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfc3ZtLmMgICAgICAgICB8IDIyOSArKysrKy0tLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb24uaCAgICAgICAgICAgICAgIHwgICA5ICstCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9tbi5jICAgICAgICAgICAgfCAyMTggKystLS0tLQogZHJpdmVycy9p
bmZpbmliYW5kL2NvcmUvZGV2aWNlLmMgICAgICAgICAgICAgIHwgICAxIC0KIGRyaXZlcnMvaW5m
aW5pYmFuZC9jb3JlL3VtZW1fb2RwLmMgICAgICAgICAgICB8IDI4OCArLS0tLS0tLS0tCiBkcml2
ZXJzL2luZmluaWJhbmQvaHcvaGZpMS9maWxlX29wcy5jICAgICAgICAgfCAgIDIgKy0KIGRyaXZl
cnMvaW5maW5pYmFuZC9ody9oZmkxL2hmaS5oICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVy
cy9pbmZpbmliYW5kL2h3L2hmaTEvdXNlcl9leHBfcmN2LmMgICAgIHwgMTQ0ICsrLS0tCiBkcml2
ZXJzL2luZmluaWJhbmQvaHcvaGZpMS91c2VyX2V4cF9yY3YuaCAgICAgfCAgIDMgKy0KIGRyaXZl
cnMvaW5maW5pYmFuZC9ody9tbHg1L21seDVfaWIuaCAgICAgICAgICB8ICAgNyArLQogZHJpdmVy
cy9pbmZpbmliYW5kL2h3L21seDUvbXIuYyAgICAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJz
L2luZmluaWJhbmQvaHcvbWx4NS9vZHAuYyAgICAgICAgICAgICAgfCAgNDggKy0KIGRyaXZlcnMv
eGVuL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQogZHJpdmVycy94
ZW4vZ250ZGV2LWNvbW1vbi5oICAgICAgICAgICAgICAgICAgIHwgICA4ICstCiBkcml2ZXJzL3hl
bi9nbnRkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNzkgKystLS0tCiBpbmNsdWRl
L2xpbnV4L2htbS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOTUgKy0tLS0tLQogaW5j
bHVkZS9saW51eC9tbXVfbm90aWZpZXIuaCAgICAgICAgICAgICAgICAgIHwgMTI0ICsrKy0KIGlu
Y2x1ZGUvcmRtYS9pYl91bWVtX29kcC5oICAgICAgICAgICAgICAgICAgICB8ICA2NSArLS0KIGlu
Y2x1ZGUvcmRtYS9pYl92ZXJicy5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAtCiBrZXJu
ZWwvZm9yay5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgLQogbW0vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiBtbS9obW0u
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNzUgKy0tLS0tLS0tCiBt
bS9tbXVfbm90aWZpZXIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1NDIgKysrKysr
KysrKysrKysrKystCiAzMiBmaWxlcyBjaGFuZ2VkLCAxMTgwIGluc2VydGlvbnMoKyksIDE5MjMg
ZGVsZXRpb25zKC0pCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
