Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F0EA4AC4
	for <lists+amd-gfx@lfdr.de>; Sun,  1 Sep 2019 19:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97352898BE;
	Sun,  1 Sep 2019 17:09:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201DD89D49
 for <amd-gfx@lists.freedesktop.org>; Sun,  1 Sep 2019 09:38:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so2202672wrx.5
 for <amd-gfx@lists.freedesktop.org>; Sun, 01 Sep 2019 02:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=7wSFt3QTv/R1Wkoa1YhGr93AWZsA0uVfWZOxtQ1uKB8=;
 b=blGLUZPkqFWu3uJio921gYXaN2gUxvMpWeok8xmhhAr7+l6Rz4Ry0Hr3w0D5e49Ekm
 H+QY103gqkisObsQen+oagmL7N01kfseemRTLu24ivqYBl/IJvnCjgJN5tEfZ7jzyYZs
 WrjbSFVLJGXah3yc7qXnuNVpUG2BcSfvG8I839VHhwOa6kNAbOdYQLTZtvAcCxNhYTfT
 F/6ufLBdy5xDGxQ0X50WywLoMSI7E/BJJWkjxaWq6Is8Cn2iCkT5gQB4MtcPM1ms0QZI
 MWMxmZalfP6GjL5FOxBJSSrngmE6CQXx3vbtChM+HAk12LhhJqxNHYN2rtbyGuF+bRgh
 QkMw==
X-Gm-Message-State: APjAAAWsO5uo/dAX+29JI3xtG1sF6IiPT4KMZelPR5W6tNQyjrH37NBx
 Lt+xR5x6K+3TabS9jkr+EP5R7V8j
X-Google-Smtp-Source: APXvYqzsPKaQD9EJyihffdQ3x8CqYmoFfl3jABzs3IRi66T8taiq8XfMkBq945JYjXYMSXdN45SPmA==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr17952291wrl.276.1567330691259; 
 Sun, 01 Sep 2019 02:38:11 -0700 (PDT)
Received: from kontron.lan
 (2001-1ae9-0ff1-f191-7c4c-b13a-fe89-a24c.ip6.tmcz.cz.
 [2001:1ae9:ff1:f191:7c4c:b13a:fe89:a24c])
 by smtp.gmail.com with ESMTPSA id c201sm21863917wmd.33.2019.09.01.02.38.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Sep 2019 02:38:10 -0700 (PDT)
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <christian.koenig@amd.com>, David1.Zhou@amd.com,
 sfr@canb.auug.org.au, jgg@mellanox.com
From: Petr Cvek <petrcvekcz@gmail.com>
Subject: [BUG, regression] Dereferencing of NULL pointer in
 radeon_mn_unregister()
Message-ID: <dad0e51a-0f06-e2b0-cef7-3587207c2045@gmail.com>
Date: Sun, 1 Sep 2019 11:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Sun, 01 Sep 2019 17:09:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=7wSFt3QTv/R1Wkoa1YhGr93AWZsA0uVfWZOxtQ1uKB8=;
 b=aqxZu757T40x8FTOwHHyOLHL74zJIeXNt2d2e1eZOtXk3ny+OJk3D15CgmDDb2xy9h
 C6KVcVqYoW6mGb7ogRWddopEON3RhSXx3BWzTL7IeUPw8xs0C35/TU9y/2xorJFozbJS
 g8h6fgqUeZ1ViZnk6QrkYJ7J0uZuigEtFYvGxb72OOfXL6f15yM/tNhplpwHmbRIzzDN
 DHDTgw1seO7/MgLO95wjFHUntuIPVOSWLv8bqIOd6iZUMmACQXMJ6Ve+L3jc3cObsXon
 DGDeRsBb9S1jIe6xFT3Lc/dJgCFqmYNHtRstO/iON0LzzkHJbreMjCzPHP4kaxJEH/Lb
 lkWw==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgprZXJuZWw6IDUuMy4wLXJjNi1uZXh0CgpBZnRlciBzdGFydGluZyBYb3JnIGFuZCBydW5u
aW5nIHhyYW5kciB0aGUgWG9yZyBjcmFzaGVzIHdpdGggKG5vdCBleGFjdGx5IHVzZWZ1bCwgaXQg
aXMgTUlQUyBkdW1wKToKClsgICAyOC44NDI1NTNdIENQVSAwIFVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAxYywgZXBjID09IDgw
OGRlNmQ0LCByYSA9PSA4MDRkMzJlYwpbICAgMjguODUzMzg3XSBPb3BzWyMxXToKWyAgIDI4Ljg1
NTY5OV0gQ1BVOiAwIFBJRDogNjkyIENvbW06IFhvcmcgTm90IHRhaW50ZWQgNS4zLjAtcmM2LW5l
eHQtMjAxOTA4MjYrICM1OQpbICAgMjguODYzMTA0XSAkIDAgICA6IDAwMDAwMDAwIDgwYjYwMDAw
IDAwMDAwMDExIDg3ZjFhZjAwClsgICAyOC44Njg0MDddICQgNCAgIDogMDAwMDAwMWMgMDAwMDAw
MDIgMDAwMDAwMDIgZmZmZjAwZmUKWyAgIDI4Ljg3MzcwNV0gJCA4ICAgOiA4NjVlOWZlMCAwMDAw
ZmMwMCAwMDAwMDAwNCAwMDAwMDAwMApbICAgMjguODc5MDAzXSAkMTIgICA6IDg3ZjFiYWYwIDAw
MDAwMDAwIDAwMDBkYTlhIDAwMDAwMDQwClsgICAyOC44ODQzMDFdICQxNiAgIDogODY0MzQ0NTAg
ODY0MzQ0MDAgMDAwMDAwMDAgMDAwMDAwMWMKWyAgIDI4Ljg4OTYwMF0gJDIwICAgOiA4NjVlOWRi
YyAwMDAwMDAwMCA4MDkxMmVlNCA4NjVlOWRiYwpbICAgMjguODk0ODk4XSAkMjQgICA6IDgwYWRk
MjIwIDI3Y2ZkNmZkICAgICAgICAgICAgICAgICAgClsgICAyOC45MDAxOThdICQyOCAgIDogODY1
ZTgwMDAgODY1ZTljYjggMDAwMDAwMDkgODA0ZDMyZWMKWyAgIDI4LjkwNTQ5OV0gSGkgICAgOiAw
MDAwOTFiYgpbICAgMjguOTA4NDE0XSBMbyAgICA6IGZmZmY2ZTQ0ClsgICAyOC45MTEzNTBdIGVw
YyAgIDogODA4ZGU2ZDQgbXV0ZXhfbG9jaysweDgvMHg0NApbICAgMjguOTE2MDQ1XSByYSAgICA6
IDgwNGQzMmVjIHJhZGVvbl9tbl91bnJlZ2lzdGVyKzB4M2MvMHhiMApbICAgMjguOTIxNjg3XSBT
dGF0dXM6IDExMDBmYzAzIEtFUk5FTCBFWEwgSUUgClsgICAyOC45MjU5MjldIENhdXNlIDogMDA4
MDAwMDggKEV4Y0NvZGUgMDIpClsgICAyOC45Mjk5ODddIEJhZFZBIDogMDAwMDAwMWMKWyAgIDI4
LjkzMjkwM10gUHJJZCAgOiAwMDAxOTY1NSAoTUlQUyAyNEtFYykKWyAgIDI4LjkzNjk2MV0gTW9k
dWxlcyBsaW5rZWQgaW46IHVzYmhpZCBoaWRfZ2VuZXJpYyBoaWQgZXZkZXYKWyAgIDI4Ljk0MjYz
NV0gUHJvY2VzcyBYb3JnIChwaWQ6IDY5MiwgdGhyZWFkaW5mbz02OGE4NGM0OCwgdGFzaz04NDQ3
N2I1MywgdGxzPTc3ZTAzZGEwKQpbICAgMjguOTUwNTY2XSBTdGFjayA6IDAwMDAwMDAwIDgwNGQz
MmU0IDAwMDAwMDAxIDAwMDAwMDAwIDg0ZDdiNDAwIDg0ZDdiNDAwIDg3ODRhMDc4IDg2NDM0NDUw
ClsgICAyOC45NTkwNDNdICAgICAgICAgODY2MzI2MDAgODY2MzI2OGMgODAzYTRlZDQgODA0MTU4
M2MgMDAwMDAwMDAgODAzYjZkOTQgODY1ZTlkYmMgODY0MzQ0NTAKWyAgIDI4Ljk2NzUxOV0gICAg
ICAgICA4NjYzMjYwMCA4NjQzNDQwMCA4NjYzMjYwMCA4MDNhNDUxYyA4NzkxMjk4MCA4NzkxMjlh
YyA4MGFlMDAwMCAwMDAwMDAwNwpbICAgMjguOTc1OTk2XSAgICAgICAgIDAwMDAwMDA3IDg2NjMy
NjIwIDg2NjMyNjAwIDgwM2E0NWQwIDg3ZmZjNzE4IDcxYThmMDAwIDcxYThmMDAwIDg3ZmZjNzFj
ClsgICAyOC45ODQ0NzJdICAgICAgICAgNzFhOGVmZmYgODAwZDNjMDggODY1ZWFjMDAgODY2MzI2
MDAgMDAwMDAwMDAgODAzYTViZjQgNzFhOGYwMDAgMDAwMDAwMDAKWyAgIDI4Ljk5Mjk0OF0gICAg
ICAgICAuLi4KWyAgIDI4Ljk5NTQyNV0gQ2FsbCBUcmFjZToKWyAgIDI4Ljk5NzkwNV0gWzw4MDhk
ZTZkND5dIG11dGV4X2xvY2srMHg4LzB4NDQKWyAgIDI5LjAwMjIzOV0gWzw4MDRkMzJlYz5dIHJh
ZGVvbl9tbl91bnJlZ2lzdGVyKzB4M2MvMHhiMApbICAgMjkuMDA3NTUwXSBbPDgwNDE1ODNjPl0g
cmFkZW9uX2dlbV9vYmplY3RfZnJlZSsweDE4LzB4MmMKWyAgIDI5LjAxMzAzMV0gWzw4MDNhNDUx
Yz5dIGRybV9nZW1fb2JqZWN0X3JlbGVhc2VfaGFuZGxlKzB4NzQvMHhhYwpbICAgMjkuMDE5MTIy
XSBbPDgwM2E0NWQwPl0gZHJtX2dlbV9oYW5kbGVfZGVsZXRlKzB4N2MvMHgxMjgKWyAgIDI5LjAy
NDU5OV0gWzw4MDNhNWJmND5dIGRybV9pb2N0bF9rZXJuZWwrMHhiMC8weDEwOApbICAgMjkuMDI5
NjMzXSBbPDgwM2E1ZTc0Pl0gZHJtX2lvY3RsKzB4MjAwLzB4M2E4ClsgICAyOS4wMzQxNTRdIFs8
ODAzZTA3YjQ+XSByYWRlb25fZHJtX2lvY3RsKzB4NTQvMHhjMApbICAgMjkuMDM5MTEwXSBbPDgw
MTIxNGRjPl0gZG9fdmZzX2lvY3RsKzB4NGU4LzB4ODFjClsgICAyOS4wNDM4ODBdIFs8ODAxMjE4
NjQ+XSBrc3lzX2lvY3RsKzB4NTQvMHhiMApbICAgMjkuMDQ4MzA1XSBbPDgwMDExMDBjPl0gc3lz
Y2FsbF9jb21tb24rMHgzNC8weDU4ClsgICAyOS4wNTMwNzRdIENvZGU6IDI0MDUwMDAyICAyN2Jk
ZmZmOCAgOGY4MzAwMDAgPGMwODUwMDAwPiAxNGEwMDAwNSAgMDAwMDAwMDAgIDAwNjAwODI1ICBl
MDgxMDAwMCAgMTAyMGZmZmEgCgpidXQgaXQgc2VlbXMgdGhlcmUgaXMgTlVMTCBwb2ludGVyIGF0
IHRoaXMgbGluZToKCglodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fbW4uYz9oPW5leHQtMjAxOTA4MzAjbjIzNwoKVGhlIGNvZGUgaXM6CgoJc3RydWN0IHJhZGVv
bl9tbiAqcm1uID0gYm8tPm1uOwoJLi4uCgltdXRleF9sb2NrKCZybW4tPmxvY2spOwkJLy88LWNy
YXNoCgpBIHF1aWNrIGFzc2VydCBwcm92ZXMgdGhlIGJvLT5tbiByZXR1cm5zIE5VTEwuIFRoZSBj
b2RlIHdvcmtlZCBpbiA0LjE5LXJjIGFuZCBpdCBzZWVtcyB0aGUgcHJvYmxlbWF0aWMgcGF0Y2gg
aXMgCgoJZHJtL3JhZGVvbjogdXNlIG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgcmFk
ZW9uX21uCgphcyBpdCByZW1vdmVzIHRoZSBOVUxMIGNoZWNrLgoKRm9yY2luZyAtRU5PREVWIGlu
IHRoZSByZWdpc3RlciBmdW50aW9uIChhbmQgaW1tZWRpYXRlIHJldHVybiBpbiB1bnJlZ2lzdGVy
IGFzIHdpdGhvdXQgQ09ORklHX01NVV9OT1RJRklFUikgd29ya3MuCgpQZXRyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
