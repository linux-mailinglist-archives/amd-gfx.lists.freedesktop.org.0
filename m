Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43606117707
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Dec 2019 21:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C1E6E51B;
	Mon,  9 Dec 2019 20:10:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4B46E51B
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Dec 2019 20:10:03 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so17633789wrq.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Dec 2019 12:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NZuKbheWikR8vpoYwGK+WkxlfgUnw64P5ld/v/olXFs=;
 b=F8trGwsJlOgaZ5BSLn6wXa5uiqi1pTREH9Y06RA/dz62/OehsG8OjS6rV2UNxkzK82
 LoI8DxT6pLDeHWucQ7d+0Zp5B59l8AxTp2yq1NcKV4o5vEQW+hcCcWNp7xebX3QqyYKV
 nl6dvof34OYkFJW5Ax6rbrfD54tV2Kt2+YPaV1IAkLXTbk/QtcYCFo+bFB8ysmb8+K9a
 AVlLL8thhheeXzGqkRwmh/p+9JHO3vp4QtMrKIEQHN5SB4AHLOi1TBIfF6m5sIxIZ/OS
 uWwCbk8IyK4UT+o3/Lzqu/LmZF9kMst4qkbMiiV+ovCXSbYtcX83egBYxmUTR9gTSfJY
 okZA==
X-Gm-Message-State: APjAAAV3grTIjFsHjwnGg1Sx5KOYozqqmbSV+DCcw6vdQe8WDZsv3jVN
 3YqcDufyMOL6tI3NKbHW9l8Ypzjm
X-Google-Smtp-Source: APXvYqyl+th6yOENnpLnRJKDZ18LLUABzPLkuTlclWLDMw33rmEHdX9eUuo0cUAQs5VOX3av3FDrlw==
X-Received: by 2002:a05:6000:12ce:: with SMTP id
 l14mr4305460wrx.342.1575922201673; 
 Mon, 09 Dec 2019 12:10:01 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 60sm615277wrn.86.2019.12.09.12.10.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 12:10:01 -0800 (PST)
Subject: Re: [PATCH 1/3] tests/amdgpu: Fix various warnings
To: Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org
References: <f57d33f459df0c733ef108b2beb889e844450542.1575917839.git.luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4428c8f2-948c-0a74-2856-c5cbed912c24@gmail.com>
Date: Mon, 9 Dec 2019 21:09:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f57d33f459df0c733ef108b2beb889e844450542.1575917839.git.luben.tuikov@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NZuKbheWikR8vpoYwGK+WkxlfgUnw64P5ld/v/olXFs=;
 b=hEoDopjIgw+sLUOj+P2k+7nlWAZiDCxdeOlyB7ztwtFAhq117n7BRBBcqEWo/icnB4
 9CETWBIrVwjTV8X6NbDTTC2J69Rg50RQAym5vS1z8kP3KZc3TFjigTLMBRHQ7+eCCuJb
 z3Ahrir2qu89j0gJF7iPAP1EgckV3P4Zhp9XA8pZn5ny0j694QnaqNhCYsDQQK18zgai
 9Xb1PVbpU+kJFDGUnpOBk1ns9fHOeVQ4XgrputBHgrGNtueowGCKnZs6LMCePaNA1E8v
 C2bLGEhMD/AOUsDDEMiyNVOaocFmF1Cmmrb9339RuaL0QHqPdQBo5rhOSi7kQJcxXrY6
 HJ6w==
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
Reply-To: christian.koenig@amd.com
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDkuMTIuMTkgdW0gMTk6NTcgc2NocmllYiBMdWJlbiBUdWlrb3Y6Cj4gVGhpcyBwYXRjaCBm
aXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmdzOgo+IC1XZm9ybWF0PQo+IC1XbWF5YmUtdW5pbml0
aWFsaXplZAo+IC1XbWlzbGVhZGluZy1pbmRlbnRhdGlvbgo+IC1Xc3RyaW5nb3AtdHJ1bmNhdGlv
bgo+IC1XdW51c2VkLWZ1bmN0aW9uCj4gLVd1bnVzZWQtdmFyaWFibGUKPgo+IEl0IGFsc28gcmVt
b3ZlcyBmb3J3YXJkIGRlY2xhcmF0aW9ucyBhbmQgbW92ZXMKPiBnbG9iYWwgZnVuY3Rpb25zIHRv
IHRoZSBib3R0b20sIGtlZXBpbmcgbG9jYWxzCj4gYXQgdGhlIHRvcCwgaW4gcmFzX3Rlc3RzLmMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgoK
QWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9y
IHRoZSBzZXJpZXMuCgo+IC0tLQo+ICAgYW1kZ3B1L2FtZGdwdV9iby5jICAgICAgICAgICB8ICAg
MiAtCj4gICB0ZXN0cy9hbWRncHUvYmFzaWNfdGVzdHMuYyAgIHwgICA3ICstCj4gICB0ZXN0cy9h
bWRncHUvYm9fdGVzdHMuYyAgICAgIHwgICA5ICstCj4gICB0ZXN0cy9hbWRncHUvY3NfdGVzdHMu
YyAgICAgIHwgICAxICsKPiAgIHRlc3RzL2FtZGdwdS9yYXNfdGVzdHMuYyAgICAgfCAyNDEgKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHRlc3RzL2FtZGdwdS9zeW5jb2Jq
X3Rlc3RzLmMgfCAgIDIgKy0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgMTI0IGluc2VydGlvbnMoKyks
IDEzOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1X2JvLmMgYi9h
bWRncHUvYW1kZ3B1X2JvLmMKPiBpbmRleCBjNTQ2ODdlZC4uZDZlYTBlNzQgMTAwNjQ0Cj4gLS0t
IGEvYW1kZ3B1L2FtZGdwdV9iby5jCj4gKysrIGIvYW1kZ3B1L2FtZGdwdV9iby5jCj4gQEAgLTM5
Niw3ICszOTYsNiBAQCB1bmxvY2s6Cj4gICBkcm1fcHVibGljIGludCBhbWRncHVfZ2V0X2ZiX2lk
KGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwgdW5zaWduZWQgaW50ICpmYl9pZCkKPiAgIHsKPiAg
IAlkcm1Nb2RlUmVzUHRyIG1vZGVfcmVzOwo+IC0JaW50IGNvdW50X2NydGNzOwo+ICAgCWRybU1v
ZGVDcnRjUHRyIG1vZGVfY3J0YzsKPiAgIAlpbnQgY3VycmVudF9pZCA9IDA7Cj4gICAJaW50IHIg
PSAwOwo+IEBAIC00MjEsNyArNDIwLDYgQEAgZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X2dldF9mYl9p
ZChhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsIHVuc2lnbmVkIGludCAqZmJfaWQpCj4gICAJaWYg
KCFtb2RlX3JlcykKPiAgIAkJcmV0dXJuIEVGQVVMVDsKPiAgIAo+IC0JY291bnRfY3J0Y3MgPSBt
b2RlX3Jlcy0+Y291bnRfY3J0Y3M7Cj4gICAJZm9yIChpID0gMDsgaSA8IG1vZGVfcmVzLT5jb3Vu
dF9jcnRjczsgaSsrKSB7Cj4gICAJCW1vZGVfY3J0YyA9IGRybU1vZGVHZXRDcnRjKGZkLCBtb2Rl
X3Jlcy0+Y3J0Y3NbaV0pOwo+ICAgCQlpZiAobW9kZV9jcnRjKSB7Cj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2FtZGdwdS9iYXNpY190ZXN0cy5jIGIvdGVzdHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMKPiBp
bmRleCBjM2MwOTcwMi4uY2NlMDY0MGEgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvYW1kZ3B1L2Jhc2lj
X3Rlc3RzLmMKPiArKysgYi90ZXN0cy9hbWRncHUvYmFzaWNfdGVzdHMuYwo+IEBAIC0zMjMxLDcg
KzMyMzEsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfbWVtY3B5X2RyYXcoYW1kZ3B1X2RldmljZV9o
YW5kbGUgZGV2aWNlX2hhbmRsZSwKPiAgIAlpbnQgYm9fY21kX3NpemUgPSA0MDk2Owo+ICAgCXN0
cnVjdCBhbWRncHVfY3NfcmVxdWVzdCBpYnNfcmVxdWVzdCA9IHswfTsKPiAgIAlzdHJ1Y3QgYW1k
Z3B1X2NzX2liX2luZm8gaWJfaW5mbz0gezB9Owo+IC0JdWludDMyX3QgaGFuZ19zdGF0ZSwgaGFu
Z3MsIGV4cGlyZWQ7Cj4gKwl1aW50MzJfdCBleHBpcmVkOwo+ICAgCWFtZGdwdV9ib19saXN0X2hh
bmRsZSBib19saXN0Owo+ICAgCXN0cnVjdCBhbWRncHVfY3NfZmVuY2UgZmVuY2Vfc3RhdHVzID0g
ezB9Owo+ICAgCj4gQEAgLTM0NzksMTAgKzM0NzksMTEgQEAgYW1kZ3B1X2RpcmVjdF9nbWFfYm9f
YWxsb2NfYW5kX21hcChhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsIGFtZGdwdV9kZXZpY2VfaGFu
ZGwKPiAgIAkJCWdvdG8gZXJyb3JfdmFfbWFwOwo+ICAgCX0KPiAgIAo+IC0JaWYgKGNwdSkKPiAr
CWlmIChjcHUpIHsKPiAgIAkJciA9IGFtZGdwdV9ib19jcHVfbWFwKGJ1Zl9oYW5kbGVfaW1wb3J0
LCBjcHUpOwo+ICAgCQlpZihyKQo+ICAgCQkJZ290byBlcnJvcl92YV9tYXA7Cj4gKwl9Cj4gICAK
PiAgIAkqYm8gPSBidWZfaGFuZGxlOwo+ICAgCSpib19wZWVyID0gYnVmX2hhbmRsZV9pbXBvcnQ7
Cj4gQEAgLTM2MTAsNyArMzYxMSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kaXJlY3RfZ21hX21t
YXAoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAo+ICAgCWFtZGdwdV9ib19oYW5kbGUgKmJ1Zl9o
YW5kbGVfaW1wb3J0Owo+ICAgCXZvbGF0aWxlIHVpbnQ4X3QgKipwdHI7Cj4gICAJc3RydWN0IGRy
bV9hbWRncHVfY2FwYWJpbGl0eSBjYXA7Cj4gLQl1aW50NjRfdCBzaXplID0gNDA5NiwgcGh5c19h
ZGRyLCByZW1haW47Cj4gKwl1aW50NjRfdCBzaXplID0gNDA5NiwgcmVtYWluOwo+ICAgCWludCBp
LCBqLCByLCB0c3RfbG9vcCA9IDIwOwo+ICAgCj4gICAJYnVmX2hhbmRsZSA9IGNhbGxvYyh0c3Rf
bG9vcCwgc2l6ZW9mKCpidWZfaGFuZGxlKSk7Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2FtZGdwdS9i
b190ZXN0cy5jIGIvdGVzdHMvYW1kZ3B1L2JvX3Rlc3RzLmMKPiBpbmRleCAyNzA0OGM4OC4uN2Zj
YWJiODUgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvYW1kZ3B1L2JvX3Rlc3RzLmMKPiArKysgYi90ZXN0
cy9hbWRncHUvYm9fdGVzdHMuYwo+IEBAIC0zMjUsOCArMzI1LDcgQEAgc3RhdGljIHZvaWQgYW1k
Z3B1X2JvX2ZpbmRfYnlfY3B1X21hcHBpbmcodm9pZCkKPiAgIH0KPiAgIHN0YXRpYyB2b2lkIGFt
ZGdwdV9nZXRfZmJfaWRfYW5kX2hhbmRsZSh2b2lkKQo+ICAgewo+IC0JdWludDMyX3QgKnB0cjsK
PiAtCWludCBpLCByOwo+ICsJaW50IHI7Cj4gICAJdW5zaWduZWQgaW50IGZiX2lkOwo+ICAgCXN0
cnVjdCBhbWRncHVfYm9faW1wb3J0X3Jlc3VsdCBvdXRwdXQ7Cj4gICAKPiBAQCAtMzUyLDcgKzM1
MSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9ib19zc2codm9pZCkKPiAgIAlpbnQgaSwgaiwgZmQ7
Cj4gICAJdWludDY0X3QgcGF0dGVybiA9IDB4ZGVhZGJlZWYxMjM0NTY3OCwgb3V0Owo+ICAgCXZv
aWQgKmJ1ZjsKPiAtCWJvb2wgd3JpdGVfaXNfb2s7Cj4gKwlib29sIHdyaXRlX2lzX29rID0gZmFs
c2U7Cj4gICAKPiAgIAlDVV9BU1NFUlQoIWFtZGdwdV9xdWVyeV9jYXBhYmlsaXR5KGRldmljZV9o
YW5kbGUsICZjYXApKTsKPiAgIAlpZighKGNhcC5mbGFnICYgQU1ER1BVX0NBUEFCSUxJVFlfU1NH
X0ZMQUcpKSB7Cj4gQEAgLTM2Myw3ICszNjIsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfYm9fc3Nn
KHZvaWQpCj4gICAJaWYgKGJ1Zl9zaXplID4gY2FwLmRpcmVjdF9nbWFfc2l6ZSA8PCAyMCkKPiAg
IAkJYnVmX3NpemUgPSBjYXAuZGlyZWN0X2dtYV9zaXplIDw8IDIwOwo+ICAgCj4gLQlwcmludGYo
IlNTRyByZWFkL3dyaXRlIGJsb2NrIHNpemUgMHgleFxuIiwgYnVmX3NpemUpOwo+ICsJcHJpbnRm
KCJTU0cgcmVhZC93cml0ZSBibG9jayBzaXplIDB4JWx4XG4iLCBidWZfc2l6ZSk7Cj4gICAKPiAg
IAlDVV9BU1NFUlQoKGZkID0gb3Blbihpbl9maWxlLCBPX1dST05MWSB8IE9fQ1JFQVQsIFNfSVJX
WFUpKSA+PSAwKTsKPiAgIAlmb3IgKGkgPSAwOyBpIDwgYnVmX3NpemU7IGkgKz0gc2l6ZW9mKHBh
dHRlcm4pKSB7Cj4gQEAgLTQxMyw3ICs0MTIsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfYm9fc3Nn
KHZvaWQpCj4gICAJZm9yIChpID0gMDsgaSA8IDM7IGkrKykgewo+ICAgCQlzdHJ1Y3QgdGltZXNw
ZWMgdHMxLCB0czI7Cj4gICAJCWRvdWJsZSBhLCBiLCBjOwo+IC0JCWJvb2wgd3JpdGVfaXNfc2Ft
ZTsKPiArCQlib29sIHdyaXRlX2lzX3NhbWUgPSBmYWxzZTsKPiAgIAo+ICAgCQlDVV9BU1NFUlQo
KGZkID0gb3BlbihvdXRfZmlsZSwgT19XUk9OTFkgfCBPX0NSRUFUIHwgT19ESVJFQ1QsIFNfSVJX
WFUpKSA+PSAwKTsKPiAgIAo+IGRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvY3NfdGVzdHMuYyBi
L3Rlc3RzL2FtZGdwdS9jc190ZXN0cy5jCj4gaW5kZXggYzA5MDNhMmEuLjEwMTI0YzE1IDEwMDY0
NAo+IC0tLSBhL3Rlc3RzL2FtZGdwdS9jc190ZXN0cy5jCj4gKysrIGIvdGVzdHMvYW1kZ3B1L2Nz
X3Rlc3RzLmMKPiBAQCAtMzYyLDYgKzM2Miw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9jc191dmRf
ZGVjb2RlKHZvaWQpCj4gICAJCWJzX2FkZHIgPSBmYl9hZGRyICsgNCoxMDI0Owo+ICAgCWRwYl9h
ZGRyID0gQUxJR04oYnNfYWRkciArIHNpemVvZih1dmRfYml0c3RyZWFtKSwgNCoxMDI0KTsKPiAg
IAo+ICsJY3R4X2FkZHIgPSAwOwo+ICAgCWlmIChmYW1pbHlfaWQgPj0gQU1ER1BVX0ZBTUlMWV9W
SSkgewo+ICAgCQlpZiAoKGZhbWlseV9pZCA9PSBBTURHUFVfRkFNSUxZX0FJKSB8fAo+ICAgCQkg
ICAgKGNoaXBfaWQgPT0gY2hpcF9yZXYrMHg1MCB8fCBjaGlwX2lkID09IGNoaXBfcmV2KzB4NUEg
fHwKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1L3Jhc190ZXN0cy5jIGIvdGVzdHMvYW1kZ3B1
L3Jhc190ZXN0cy5jCj4gaW5kZXggYzFjNTQzYzEuLmQ3MTRiZTczIDEwMDY0NAo+IC0tLSBhL3Rl
c3RzL2FtZGdwdS9yYXNfdGVzdHMuYwo+ICsrKyBiL3Rlc3RzL2FtZGdwdS9yYXNfdGVzdHMuYwo+
IEBAIC01MjIsMTI0ICs1MjIsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfbG9va3VwX2lkKGRy
bURldmljZVB0ciBkZXZpY2UpCj4gICAJcmV0dXJuIC0xOwo+ICAgfQo+ICAgCj4gLUNVX0JPT0wg
c3VpdGVfcmFzX3Rlc3RzX2VuYWJsZSh2b2lkKQo+IC17Cj4gLQlhbWRncHVfZGV2aWNlX2hhbmRs
ZSBkZXZpY2VfaGFuZGxlOwo+IC0JdWludDMyX3QgIG1ham9yX3ZlcnNpb247Cj4gLQl1aW50MzJf
dCAgbWlub3JfdmVyc2lvbjsKPiAtCWludCBpOwo+IC0JZHJtRGV2aWNlUHRyIGRldmljZTsKPiAt
Cj4gLQlmb3IgKGkgPSAwOyBpIDwgTUFYX0NBUkRTX1NVUFBPUlRFRCAmJiBkcm1fYW1kZ3B1W2ld
ID49IDA7IGkrKykgewo+IC0JCWlmIChhbWRncHVfZGV2aWNlX2luaXRpYWxpemUoZHJtX2FtZGdw
dVtpXSwgJm1ham9yX3ZlcnNpb24sCj4gLQkJCQkJJm1pbm9yX3ZlcnNpb24sICZkZXZpY2VfaGFu
ZGxlKSkKPiAtCQkJY29udGludWU7Cj4gLQo+IC0JCWlmIChkcm1HZXREZXZpY2UyKGRybV9hbWRn
cHVbaV0sCj4gLQkJCQkJRFJNX0RFVklDRV9HRVRfUENJX1JFVklTSU9OLAo+IC0JCQkJCSZkZXZp
Y2UpKQo+IC0JCQljb250aW51ZTsKPiAtCj4gLQkJaWYgKGRldmljZS0+YnVzdHlwZSA9PSBEUk1f
QlVTX1BDSSAmJgo+IC0JCQkJYW1kZ3B1X3Jhc19sb29rdXBfY2FwYWJpbGl0eShkZXZpY2VfaGFu
ZGxlKSkgewo+IC0JCQlhbWRncHVfZGV2aWNlX2RlaW5pdGlhbGl6ZShkZXZpY2VfaGFuZGxlKTsK
PiAtCQkJcmV0dXJuIENVX1RSVUU7Cj4gLQkJfQo+IC0KPiAtCQlpZiAoYW1kZ3B1X2RldmljZV9k
ZWluaXRpYWxpemUoZGV2aWNlX2hhbmRsZSkpCj4gLQkJCWNvbnRpbnVlOwo+IC0JfQo+IC0KPiAt
CXJldHVybiBDVV9GQUxTRTsKPiAtfQo+IC0KPiAtaW50IHN1aXRlX3Jhc190ZXN0c19pbml0KHZv
aWQpCj4gLXsKPiAtCWRybURldmljZVB0ciBkZXZpY2U7Cj4gLQlhbWRncHVfZGV2aWNlX2hhbmRs
ZSBkZXZpY2VfaGFuZGxlOwo+IC0JdWludDMyX3QgIG1ham9yX3ZlcnNpb247Cj4gLQl1aW50MzJf
dCAgbWlub3JfdmVyc2lvbjsKPiAtCXVpbnQzMl90ICBjYXBhYmlsaXR5Owo+IC0Jc3RydWN0IHJh
c190ZXN0X21hc2sgdGVzdF9tYXNrOwo+IC0JaW50IGlkOwo+IC0JaW50IGk7Cj4gLQlpbnQgcjsK
PiAtCj4gLQlmb3IgKGkgPSAwOyBpIDwgTUFYX0NBUkRTX1NVUFBPUlRFRCAmJiBkcm1fYW1kZ3B1
W2ldID49IDA7IGkrKykgewo+IC0JCXIgPSBhbWRncHVfZGV2aWNlX2luaXRpYWxpemUoZHJtX2Ft
ZGdwdVtpXSwgJm1ham9yX3ZlcnNpb24sCj4gLQkJCQkmbWlub3JfdmVyc2lvbiwgJmRldmljZV9o
YW5kbGUpOwo+IC0JCWlmIChyKQo+IC0JCQljb250aW51ZTsKPiAtCj4gLQkJaWYgKGRybUdldERl
dmljZTIoZHJtX2FtZGdwdVtpXSwKPiAtCQkJCQlEUk1fREVWSUNFX0dFVF9QQ0lfUkVWSVNJT04s
Cj4gLQkJCQkJJmRldmljZSkpIHsKPiAtCQkJYW1kZ3B1X2RldmljZV9kZWluaXRpYWxpemUoZGV2
aWNlX2hhbmRsZSk7Cj4gLQkJCWNvbnRpbnVlOwo+IC0JCX0KPiAtCj4gLQkJaWYgKGRldmljZS0+
YnVzdHlwZSAhPSBEUk1fQlVTX1BDSSkgewo+IC0JCQlhbWRncHVfZGV2aWNlX2RlaW5pdGlhbGl6
ZShkZXZpY2VfaGFuZGxlKTsKPiAtCQkJY29udGludWU7Cj4gLQkJfQo+IC0KPiAtCQljYXBhYmls
aXR5ID0gYW1kZ3B1X3Jhc19sb29rdXBfY2FwYWJpbGl0eShkZXZpY2VfaGFuZGxlKTsKPiAtCQlp
ZiAoY2FwYWJpbGl0eSA9PSAwKSB7Cj4gLQkJCWFtZGdwdV9kZXZpY2VfZGVpbml0aWFsaXplKGRl
dmljZV9oYW5kbGUpOwo+IC0JCQljb250aW51ZTsKPiAtCj4gLQkJfQo+IC0KPiAtCQlpZCA9IGFt
ZGdwdV9yYXNfbG9va3VwX2lkKGRldmljZSk7Cj4gLQkJaWYgKGlkID09IC0xKSB7Cj4gLQkJCWFt
ZGdwdV9kZXZpY2VfZGVpbml0aWFsaXplKGRldmljZV9oYW5kbGUpOwo+IC0JCQljb250aW51ZTsK
PiAtCQl9Cj4gLQo+IC0JCXRlc3RfbWFzayA9IGFtZGdwdV9yYXNfZ2V0X3Rlc3RfbWFzayhkZXZp
Y2UpOwo+IC0KPiAtCQlkZXZpY2VzW2RldmljZXNfY291bnQrK10gPSAoc3RydWN0IGFtZGdwdV9y
YXNfZGF0YSkgewo+IC0JCQlkZXZpY2VfaGFuZGxlLCBpZCwgY2FwYWJpbGl0eSwgdGVzdF9tYXNr
LAo+IC0JCX07Cj4gLQl9Cj4gLQo+IC0JaWYgKGRldmljZXNfY291bnQgPT0gMCkKPiAtCQlyZXR1
cm4gQ1VFX1NJTklUX0ZBSUxFRDsKPiAtCj4gLQlyZXR1cm4gQ1VFX1NVQ0NFU1M7Cj4gLX0KPiAt
Cj4gLWludCBzdWl0ZV9yYXNfdGVzdHNfY2xlYW4odm9pZCkKPiAtewo+IC0JaW50IHI7Cj4gLQlp
bnQgaTsKPiAtCWludCByZXQgPSBDVUVfU1VDQ0VTUzsKPiAtCj4gLQlmb3IgKGkgPSAwOyBpIDwg
ZGV2aWNlc19jb3VudDsgaSsrKSB7Cj4gLQkJciA9IGFtZGdwdV9kZXZpY2VfZGVpbml0aWFsaXpl
KGRldmljZXNbaV0uZGV2aWNlX2hhbmRsZSk7Cj4gLQkJaWYgKHIpCj4gLQkJCXJldCA9IENVRV9T
Q0xFQU5fRkFJTEVEOwo+IC0JfQo+IC0JcmV0dXJuIHJldDsKPiAtfQo+IC0KPiAtc3RhdGljIHZv
aWQgYW1kZ3B1X3Jhc19kaXNhYmxlX3Rlc3Qodm9pZCk7Cj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9y
YXNfZW5hYmxlX3Rlc3Qodm9pZCk7Cj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfaW5qZWN0X3Rl
c3Qodm9pZCk7Cj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfcXVlcnlfdGVzdCh2b2lkKTsKPiAt
c3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19iYXNpY190ZXN0KHZvaWQpOwo+IC0KPiAtQ1VfVGVzdElu
Zm8gcmFzX3Rlc3RzW10gPSB7Cj4gLQl7ICJyYXMgYmFzaWMgdGVzdCIsCWFtZGdwdV9yYXNfYmFz
aWNfdGVzdCB9LAo+IC0JeyAicmFzIHF1ZXJ5IHRlc3QiLAlhbWRncHVfcmFzX3F1ZXJ5X3Rlc3Qg
fSwKPiAtCXsgInJhcyBpbmplY3QgdGVzdCIsCWFtZGdwdV9yYXNfaW5qZWN0X3Rlc3QgfSwKPiAt
CXsgInJhcyBkaXNhYmxlIHRlc3QiLAlhbWRncHVfcmFzX2Rpc2FibGVfdGVzdCB9LAo+IC0jaWYg
MAo+IC0JeyAicmFzIGVuYWJsZSB0ZXN0IiwJYW1kZ3B1X3Jhc19lbmFibGVfdGVzdCB9LAo+IC0j
ZW5kaWYKPiAtCUNVX1RFU1RfSU5GT19OVUxMLAo+IC19Owo+IC0KPiAgIC8vaGVscGVycwo+ICAg
Cj4gICBzdGF0aWMgaW50IHRlc3RfY2FyZDsKPiBAQCAtNjQ4LDEwICs1MzAsOCBAQCBzdGF0aWMg
Y2hhciBkZWJ1Z2ZzX3BhdGhbMTAyNF07Cj4gICBzdGF0aWMgdWludDMyX3QgcmFzX21hc2s7Cj4g
ICBzdGF0aWMgYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2aWNlX2hhbmRsZTsKPiAgIAo+IC1zdGF0
aWMgaW50IHNldF90ZXN0X2NhcmQoaW50IGNhcmQpCj4gK3N0YXRpYyB2b2lkIHNldF90ZXN0X2Nh
cmQoaW50IGNhcmQpCj4gICB7Cj4gLQlpbnQgaTsKPiAtCj4gICAJdGVzdF9jYXJkID0gY2FyZDsK
PiAgIAlzcHJpbnRmKHN5c2ZzX3BhdGgsICIvc3lzL2NsYXNzL2RybS9jYXJkJWQvZGV2aWNlL3Jh
cy8iLCBkZXZpY2VzW2NhcmRdLmlkKTsKPiAgIAlzcHJpbnRmKGRlYnVnZnNfcGF0aCwgIi9zeXMv
a2VybmVsL2RlYnVnL2RyaS8lZC9yYXMvIiwgZGV2aWNlc1tjYXJkXS5pZCk7Cj4gQEAgLTY2MCw4
ICs1NDAsNiBAQCBzdGF0aWMgaW50IHNldF90ZXN0X2NhcmQoaW50IGNhcmQpCj4gICAJcmFzX2Js
b2NrX21hc2tfaW5qZWN0ID0gZGV2aWNlc1tjYXJkXS50ZXN0X21hc2suaW5qZWN0X21hc2s7Cj4g
ICAJcmFzX2Jsb2NrX21hc2tfcXVlcnkgPSBkZXZpY2VzW2NhcmRdLnRlc3RfbWFzay5xdWVyeV9t
YXNrOwo+ICAgCXJhc19ibG9ja19tYXNrX2Jhc2ljID0gZGV2aWNlc1tjYXJkXS50ZXN0X21hc2su
YmFzaWNfbWFzazsKPiAtCj4gLQlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGNvbnN0
IGNoYXIgKmdldF9yYXNfc3lzZnNfcm9vdCh2b2lkKQo+IEBAIC03NDIsNyArNjIwLDYgQEAgc3Rh
dGljIGludCBhbWRncHVfcmFzX3F1ZXJ5X2Vycl9jb3VudChlbnVtIGFtZGdwdV9yYXNfYmxvY2sg
YmxvY2ssCj4gICB7Cj4gICAJY2hhciBidWZbNjRdOwo+ICAgCWNoYXIgbmFtZVsxMDI0XTsKPiAt
CWludCByZXQ7Cj4gICAKPiAgIAkqdWUgPSAqY2UgPSAwOwo+ICAgCj4gQEAgLTc3OSw3ICs2NTYs
NyBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfaW5qZWN0KGVudW0gYW1kZ3B1X3Jhc19ibG9jayBi
bG9jaywKPiAgIAlpbmplY3QtPmhlYWQuYmxvY2sgPSBibG9jazsKPiAgIAlpbmplY3QtPmhlYWQu
dHlwZSA9IHR5cGU7Cj4gICAJaW5qZWN0LT5oZWFkLnN1Yl9ibG9ja19pbmRleCA9IHN1Yl9ibG9j
azsKPiAtCXN0cm5jcHkoaW5qZWN0LT5oZWFkLm5hbWUsIHJhc19ibG9ja19zdHIoYmxvY2spLCAz
Mik7Cj4gKwlzdHJuY3B5KGluamVjdC0+aGVhZC5uYW1lLCByYXNfYmxvY2tfc3RyKGJsb2NrKSwg
c2l6ZW9mKGluamVjdC0+aGVhZC5uYW1lKS0xKTsKPiAgIAlpbmplY3QtPmFkZHJlc3MgPSBhZGRy
ZXNzOwo+ICAgCWluamVjdC0+dmFsdWUgPSB2YWx1ZTsKPiAgIAo+IEBAIC05NTYsOCArODMzLDYg
QEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19xdWVyeV90ZXN0KHZvaWQpCj4gICAKPiAgIHN0YXRp
YyB2b2lkIGFtZGdwdV9yYXNfYmFzaWNfdGVzdCh2b2lkKQo+ICAgewo+IC0JdW5zaWduZWQgbG9u
ZyB1ZSwgY2U7Cj4gLQljaGFyIG5hbWVbMTAyNF07Cj4gICAJaW50IHJldDsKPiAgIAlpbnQgaTsK
PiAgIAlpbnQgajsKPiBAQCAtMTAwMCwzICs4NzUsMTE1IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9y
YXNfYmFzaWNfdGVzdCh2b2lkKQo+ICAgCQl9Cj4gICAJfQo+ICAgfQo+ICsKPiArQ1VfVGVzdElu
Zm8gcmFzX3Rlc3RzW10gPSB7Cj4gKwl7ICJyYXMgYmFzaWMgdGVzdCIsCWFtZGdwdV9yYXNfYmFz
aWNfdGVzdCB9LAo+ICsJeyAicmFzIHF1ZXJ5IHRlc3QiLAlhbWRncHVfcmFzX3F1ZXJ5X3Rlc3Qg
fSwKPiArCXsgInJhcyBpbmplY3QgdGVzdCIsCWFtZGdwdV9yYXNfaW5qZWN0X3Rlc3QgfSwKPiAr
CXsgInJhcyBkaXNhYmxlIHRlc3QiLAlhbWRncHVfcmFzX2Rpc2FibGVfdGVzdCB9LAo+ICsjaWYg
MAo+ICsJeyAicmFzIGVuYWJsZSB0ZXN0IiwJYW1kZ3B1X3Jhc19lbmFibGVfdGVzdCB9LAo+ICsj
ZW5kaWYKPiArCUNVX1RFU1RfSU5GT19OVUxMLAo+ICt9Owo+ICsKPiArQ1VfQk9PTCBzdWl0ZV9y
YXNfdGVzdHNfZW5hYmxlKHZvaWQpCj4gK3sKPiArCWFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldmlj
ZV9oYW5kbGU7Cj4gKwl1aW50MzJfdCAgbWFqb3JfdmVyc2lvbjsKPiArCXVpbnQzMl90ICBtaW5v
cl92ZXJzaW9uOwo+ICsJaW50IGk7Cj4gKwlkcm1EZXZpY2VQdHIgZGV2aWNlOwo+ICsKPiArCWZv
ciAoaSA9IDA7IGkgPCBNQVhfQ0FSRFNfU1VQUE9SVEVEICYmIGRybV9hbWRncHVbaV0gPj0gMDsg
aSsrKSB7Cj4gKwkJaWYgKGFtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZShkcm1fYW1kZ3B1W2ldLCAm
bWFqb3JfdmVyc2lvbiwKPiArCQkJCQkmbWlub3JfdmVyc2lvbiwgJmRldmljZV9oYW5kbGUpKQo+
ICsJCQljb250aW51ZTsKPiArCj4gKwkJaWYgKGRybUdldERldmljZTIoZHJtX2FtZGdwdVtpXSwK
PiArCQkJCQlEUk1fREVWSUNFX0dFVF9QQ0lfUkVWSVNJT04sCj4gKwkJCQkJJmRldmljZSkpCj4g
KwkJCWNvbnRpbnVlOwo+ICsKPiArCQlpZiAoZGV2aWNlLT5idXN0eXBlID09IERSTV9CVVNfUENJ
ICYmCj4gKwkJCQlhbWRncHVfcmFzX2xvb2t1cF9jYXBhYmlsaXR5KGRldmljZV9oYW5kbGUpKSB7
Cj4gKwkJCWFtZGdwdV9kZXZpY2VfZGVpbml0aWFsaXplKGRldmljZV9oYW5kbGUpOwo+ICsJCQly
ZXR1cm4gQ1VfVFJVRTsKPiArCQl9Cj4gKwo+ICsJCWlmIChhbWRncHVfZGV2aWNlX2RlaW5pdGlh
bGl6ZShkZXZpY2VfaGFuZGxlKSkKPiArCQkJY29udGludWU7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJu
IENVX0ZBTFNFOwo+ICt9Cj4gKwo+ICtpbnQgc3VpdGVfcmFzX3Rlc3RzX2luaXQodm9pZCkKPiAr
ewo+ICsJZHJtRGV2aWNlUHRyIGRldmljZTsKPiArCWFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldmlj
ZV9oYW5kbGU7Cj4gKwl1aW50MzJfdCAgbWFqb3JfdmVyc2lvbjsKPiArCXVpbnQzMl90ICBtaW5v
cl92ZXJzaW9uOwo+ICsJdWludDMyX3QgIGNhcGFiaWxpdHk7Cj4gKwlzdHJ1Y3QgcmFzX3Rlc3Rf
bWFzayB0ZXN0X21hc2s7Cj4gKwlpbnQgaWQ7Cj4gKwlpbnQgaTsKPiArCWludCByOwo+ICsKPiAr
CWZvciAoaSA9IDA7IGkgPCBNQVhfQ0FSRFNfU1VQUE9SVEVEICYmIGRybV9hbWRncHVbaV0gPj0g
MDsgaSsrKSB7Cj4gKwkJciA9IGFtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZShkcm1fYW1kZ3B1W2ld
LCAmbWFqb3JfdmVyc2lvbiwKPiArCQkJCSZtaW5vcl92ZXJzaW9uLCAmZGV2aWNlX2hhbmRsZSk7
Cj4gKwkJaWYgKHIpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlpZiAoZHJtR2V0RGV2aWNlMihk
cm1fYW1kZ3B1W2ldLAo+ICsJCQkJCURSTV9ERVZJQ0VfR0VUX1BDSV9SRVZJU0lPTiwKPiArCQkJ
CQkmZGV2aWNlKSkgewo+ICsJCQlhbWRncHVfZGV2aWNlX2RlaW5pdGlhbGl6ZShkZXZpY2VfaGFu
ZGxlKTsKPiArCQkJY29udGludWU7Cj4gKwkJfQo+ICsKPiArCQlpZiAoZGV2aWNlLT5idXN0eXBl
ICE9IERSTV9CVVNfUENJKSB7Cj4gKwkJCWFtZGdwdV9kZXZpY2VfZGVpbml0aWFsaXplKGRldmlj
ZV9oYW5kbGUpOwo+ICsJCQljb250aW51ZTsKPiArCQl9Cj4gKwo+ICsJCWNhcGFiaWxpdHkgPSBh
bWRncHVfcmFzX2xvb2t1cF9jYXBhYmlsaXR5KGRldmljZV9oYW5kbGUpOwo+ICsJCWlmIChjYXBh
YmlsaXR5ID09IDApIHsKPiArCQkJYW1kZ3B1X2RldmljZV9kZWluaXRpYWxpemUoZGV2aWNlX2hh
bmRsZSk7Cj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQl9Cj4gKwo+ICsJCWlkID0gYW1kZ3B1X3Jh
c19sb29rdXBfaWQoZGV2aWNlKTsKPiArCQlpZiAoaWQgPT0gLTEpIHsKPiArCQkJYW1kZ3B1X2Rl
dmljZV9kZWluaXRpYWxpemUoZGV2aWNlX2hhbmRsZSk7Cj4gKwkJCWNvbnRpbnVlOwo+ICsJCX0K
PiArCj4gKwkJdGVzdF9tYXNrID0gYW1kZ3B1X3Jhc19nZXRfdGVzdF9tYXNrKGRldmljZSk7Cj4g
Kwo+ICsJCWRldmljZXNbZGV2aWNlc19jb3VudCsrXSA9IChzdHJ1Y3QgYW1kZ3B1X3Jhc19kYXRh
KSB7Cj4gKwkJCWRldmljZV9oYW5kbGUsIGlkLCBjYXBhYmlsaXR5LCB0ZXN0X21hc2ssCj4gKwkJ
fTsKPiArCX0KPiArCj4gKwlpZiAoZGV2aWNlc19jb3VudCA9PSAwKQo+ICsJCXJldHVybiBDVUVf
U0lOSVRfRkFJTEVEOwo+ICsKPiArCXJldHVybiBDVUVfU1VDQ0VTUzsKPiArfQo+ICsKPiAraW50
IHN1aXRlX3Jhc190ZXN0c19jbGVhbih2b2lkKQo+ICt7Cj4gKwlpbnQgcjsKPiArCWludCBpOwo+
ICsJaW50IHJldCA9IENVRV9TVUNDRVNTOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBkZXZpY2Vz
X2NvdW50OyBpKyspIHsKPiArCQlyID0gYW1kZ3B1X2RldmljZV9kZWluaXRpYWxpemUoZGV2aWNl
c1tpXS5kZXZpY2VfaGFuZGxlKTsKPiArCQlpZiAocikKPiArCQkJcmV0ID0gQ1VFX1NDTEVBTl9G
QUlMRUQ7Cj4gKwl9Cj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2Ft
ZGdwdS9zeW5jb2JqX3Rlc3RzLmMgYi90ZXN0cy9hbWRncHUvc3luY29ial90ZXN0cy5jCj4gaW5k
ZXggODY5ZWQ4OGUuLjNhN2IzOGViIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2FtZGdwdS9zeW5jb2Jq
X3Rlc3RzLmMKPiArKysgYi90ZXN0cy9hbWRncHUvc3luY29ial90ZXN0cy5jCj4gQEAgLTk2LDcg
Kzk2LDcgQEAgc3RhdGljIGludCBzeW5jb2JqX2NvbW1hbmRfc3VibWlzc2lvbl9oZWxwZXIodWlu
dDMyX3Qgc3luY29ial9oYW5kbGUsIGJvb2wKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2NzX2ZlbmNlIGZl
bmNlX3N0YXR1czsKPiAgIAlhbWRncHVfYm9fbGlzdF9oYW5kbGUgYm9fbGlzdDsKPiAgIAlhbWRn
cHVfdmFfaGFuZGxlIHZhX2hhbmRsZTsKPiAtCXVpbnQzMl90IGV4cGlyZWQsIGZsYWdzOwo+ICsJ
dWludDMyX3QgZXhwaXJlZDsKPiAgIAlpbnQgaSwgcjsKPiAgIAl1aW50NjRfdCBzZXFfbm87Cj4g
ICAJc3RhdGljIHVpbnQzMl90ICpwdHI7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
