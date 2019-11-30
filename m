Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A710E209
	for <lists+amd-gfx@lfdr.de>; Sun,  1 Dec 2019 14:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA7A89A75;
	Sun,  1 Dec 2019 13:33:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DF26E97E
 for <amd-gfx@lists.freedesktop.org>; Sat, 30 Nov 2019 04:38:06 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k1so15419307pgg.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Nov 2019 20:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QOcATAytYdAUYAj61d6IpYGu6sX7w+eDXWKXj+6FQJQ=;
 b=ZexFv8gCOzTDI0H5lAxWNLNbC3C9EAjpn1mUTt3wKtnn1+SOb+dUL2a+9dXWxTWiG1
 A06GRiTjR2cPVWfvwCx23jwGR7iMAoUWY58oQWxqpVeDXSYOAjmdvXE4e2XEno3xpACv
 HsSE1qCjoifg4yZCbGp8iTsa3TwKM4sw3LYo0zs8nqDHfUX2e//EKffGdHShzEQzjYm0
 CkjX62weMIab/aYXBq903QymDvmwZf2mELHlQLN2mQ6wS3LPbe4NX56k3R6nCEWq0Djr
 S5ScUb+2srvZOPABxzCQx10O3CSs2MNY7R8gnh4XD+Y5EFiXnZulwgYLWqtjNZFkSUox
 q0CQ==
X-Gm-Message-State: APjAAAUMTdr+2KCXOXOKlUd/IN3bYfKXZOrvo/gzJyeWKvNAvMWQfdxA
 gNvC3RgGi9i6s26kw4wjanJJww==
X-Google-Smtp-Source: APXvYqzl0nI0zkWWC3GyKCb6vZsvk9rxrHliKFgB87oUCzOLq1iKPzZZGPQRAsp0IfRBsqcqrmHOmQ==
X-Received: by 2002:a63:2949:: with SMTP id p70mr20698711pgp.191.1575088686021; 
 Fri, 29 Nov 2019 20:38:06 -0800 (PST)
Received: from google.com ([2620:0:1000:2511:b34b:87b6:d099:91b0])
 by smtp.gmail.com with ESMTPSA id em16sm15839604pjb.21.2019.11.29.20.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 20:38:05 -0800 (PST)
Date: Fri, 29 Nov 2019 20:38:00 -0800
From: Tom Anderson <thomasanderson@google.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH] drm/amd/display: Reduce HDMI pixel encoding if max clock
 is exceeded
Message-ID: <20191130043800.GA217968@google.com>
References: <20191123052900.77205-1-thomasanderson@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191123052900.77205-1-thomasanderson@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 01 Dec 2019 13:33:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QOcATAytYdAUYAj61d6IpYGu6sX7w+eDXWKXj+6FQJQ=;
 b=j9vy/S7L+YPvk/Jb7NxdDWzFdsJueZLTJ3U6EgdCpIk7hNzWDsues1GqszWHtonsMh
 90b+SsPYMPNrhmrTZ5ADJkEQvzZSWVLx2iPo8Lur7LbeKSGx1IiKBEOs2ARaZe/VAZN4
 W5ioSAgI1FEMGfkGprjvVZdnVtgdg32u4nhsR9PQ3FdBlaf0wZnG9toZUwDdtLx3+vTg
 UOYOTPGUio45KoPlbZDOV9L82I2ZLtyVKfLAX1SkamZjfwzQKUTaCH5WbmP3mz5LtCD5
 RYzB6/F3IXQvN0aIkUYGMHWFMAytc03Ws7fMsTS78uWy2PRvPwlgvq+tMvLsHoaFWrrs
 Ucpw==
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
Cc: David Zhou <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBqdXN0IHJlYWxpemVkIHRoYXQgYXQgNDoyOjIsIHRoZSBwaXhlbCBjbG9jayBpc24ndCBhY3R1
YWxseSBkZWNyZWFzZWQgdG8gMy80Cm9mIGl0J3MgdmFsdWUgYXQgNDo0OjQuIEknbGwgc2VuZCBh
IHJldmlzZWQgcGF0Y2ggb24gTW9uZGF5LgoKT24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDk6Mjk6
MDBQTSAtMDgwMCwgVGhvbWFzIEFuZGVyc29uIHdyb3RlOgo+IEZvciBoaWdoLXJlcyAoOEspIG9y
IEhGUiAoNEsxMjApIGRpc3BsYXlzLCB1c2luZyB1bmNvbXByZXNzZWQgcGl4ZWwKPiBmb3JtYXRz
IGxpa2UgWUNiQ3I0NDQgd291bGQgZXhjZWVkIHRoZSBiYW5kd2lkdGggb2YgSERNSSAyLjAsIHNv
IHRoZQo+ICJpbnRlcmVzdGluZyIgbW9kZXMgd291bGQgYmUgZGlzYWJsZWQsIGxlYXZpbmcgb25s
eSBsb3ctcmVzIG9yIGxvdwo+IGZyYW1lcmF0ZSBtb2Rlcy4KPiAKPiBUaGlzIGNoYW5nZSBsb3dl
cnMgdGhlIHBpeGVsIGVuY29kaW5nIHRvIDQ6MjoyIG9yIDQ6MjowIGlmIHRoZSBtYXggVE1EUwo+
IGNsb2NrIGlzIGV4Y2VlZGVkLiBWZXJpZmllZCB0aGF0IDhLMzAgYW5kIDRLMTIwIGFyZSBub3cg
YXZhaWxhYmxlIGFuZAo+IHdvcmtpbmcgd2l0aCBhIFNhbXN1bmcgUTkwMFIgb3ZlciBhbiBIRE1J
IDIuMGIgbGluayBmcm9tIGEgUmFkZW9uIDU3MDAuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFz
IEFuZGVyc29uIDx0aG9tYXNhbmRlcnNvbkBnb29nbGUuY29tPgo+IC0tLQo+ICAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzMCArKysrKysrKysrKysrKy0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwo+IGluZGV4IDQxMzlmMTI5ZWFmYi4uYTUwN2E2ZjA0YzgyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAgLTMy
NjksMTMgKzMyNjksMTUgQEAgc3RhdGljIHZvaWQgcmVkdWNlX21vZGVfY29sb3VyX2RlcHRoKHN0
cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nX291dCkKPiAgCXRpbWluZ19vdXQtPmRpc3BsYXlf
Y29sb3JfZGVwdGgtLTsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgYWRqdXN0X2NvbG91cl9kZXB0
aF9mcm9tX2Rpc3BsYXlfaW5mbyhzdHJ1Y3QgZGNfY3J0Y190aW1pbmcgKnRpbWluZ19vdXQsCj4g
LQkJCQkJCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICppbmZvKQo+ICtzdGF0aWMgdm9p
ZCBhZGp1c3RfdGltaW5nX2Zyb21fZGlzcGxheV9pbmZvKAo+ICsJc3RydWN0IGRjX2NydGNfdGlt
aW5nICp0aW1pbmdfb3V0LAo+ICsJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm8s
Cj4gKwljb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZV9pbikKPiAgewo+ICAJaW50
IG5vcm1hbGl6ZWRfY2xrOwo+IC0JaWYgKHRpbWluZ19vdXQtPmRpc3BsYXlfY29sb3JfZGVwdGgg
PD0gQ09MT1JfREVQVEhfODg4KQo+ICsJaWYgKHRpbWluZ19vdXQtPmRpc3BsYXlfY29sb3JfZGVw
dGggPCBDT0xPUl9ERVBUSF84ODgpCj4gIAkJcmV0dXJuOwo+IC0JZG8gewo+ICsJd2hpbGUgKHRp
bWluZ19vdXQtPmRpc3BsYXlfY29sb3JfZGVwdGggPiBDT0xPUl9ERVBUSF84ODgpIHsKPiAgCQlu
b3JtYWxpemVkX2NsayA9IHRpbWluZ19vdXQtPnBpeF9jbGtfMTAwaHogLyAxMDsKPiAgCQkvKiBZ
Q2JDciA0OjI6MCByZXF1aXJlcyBhZGRpdGlvbmFsIGFkanVzdG1lbnQgb2YgMS8yICovCj4gIAkJ
aWYgKHRpbWluZ19vdXQtPnBpeGVsX2VuY29kaW5nID09IFBJWEVMX0VOQ09ESU5HX1lDQkNSNDIw
KQo+IEBAIC0zMjk3LDkgKzMyOTksMjMgQEAgc3RhdGljIHZvaWQgYWRqdXN0X2NvbG91cl9kZXB0
aF9mcm9tX2Rpc3BsYXlfaW5mbyhzdHJ1Y3QgZGNfY3J0Y190aW1pbmcgKnRpbWluZ18KPiAgCQlp
ZiAobm9ybWFsaXplZF9jbGsgPD0gaW5mby0+bWF4X3RtZHNfY2xvY2spCj4gIAkJCXJldHVybjsK
PiAgCQlyZWR1Y2VfbW9kZV9jb2xvdXJfZGVwdGgodGltaW5nX291dCk7Cj4gKwl9Cj4gIAo+IC0J
fSB3aGlsZSAodGltaW5nX291dC0+ZGlzcGxheV9jb2xvcl9kZXB0aCA+IENPTE9SX0RFUFRIXzg4
OCk7Cj4gLQo+ICsJLyogVGhlIGNvbG9yIGRlcHRoIGlzIDg4OCBhbmQgY2Fubm90IGJlIHJlZHVj
ZWQgYW55IGZ1cnRoZXIsIGJ1dCB0aGUKPiArCSAqIGNsb2NrIHdvdWxkIHN0aWxsIGV4Y2VlZCB0
aGUgbWF4IHRtZHMgY2xvY2suIFRyeSByZWR1Y2luZyB0aGUgcGl4ZWwKPiArCSAqIGVuY29kaW5n
IG5leHQuCj4gKwkgKi8KPiArCWlmICh0aW1pbmdfb3V0LT5waXhlbF9lbmNvZGluZyA9PSBQSVhF
TF9FTkNPRElOR19SR0IgfHwKPiArCSAgICB0aW1pbmdfb3V0LT5waXhlbF9lbmNvZGluZyA9PSBQ
SVhFTF9FTkNPRElOR19ZQ0JDUjQ0NCkgewo+ICsJCS8qIFlDQkNSNDIyIGlzIGFsd2F5cyBzdXBw
b3J0ZWQuICovCj4gKwkJdGltaW5nX291dC0+cGl4ZWxfZW5jb2RpbmcgPSBQSVhFTF9FTkNPRElO
R19ZQ0JDUjQyMjsKPiArCQlub3JtYWxpemVkX2NsayA9ICh0aW1pbmdfb3V0LT5waXhfY2xrXzEw
MGh6ICogMykgLyA0MDsKPiArCQlpZiAobm9ybWFsaXplZF9jbGsgPD0gaW5mby0+bWF4X3RtZHNf
Y2xvY2spCj4gKwkJCXJldHVybjsKPiArCX0KPiArCS8qIFlDQkNSNDIwIG1heSBvbmx5IGJlIHN1
cHBvcnRlZCBvbiBzcGVjaWZpYyBtb2Rlcy4gKi8KPiArCWlmIChkcm1fbW9kZV9pc180MjBfYWxz
byhpbmZvLCBtb2RlX2luKSkKPiArCQl0aW1pbmdfb3V0LT5waXhlbF9lbmNvZGluZyA9IFBJWEVM
X0VOQ09ESU5HX1lDQkNSNDIwOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBmaWxsX3N0cmVhbV9w
cm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZSgKPiBAQCAtMzM2Niw3ICszMzgyLDcgQEAg
c3RhdGljIHZvaWQgZmlsbF9zdHJlYW1fcHJvcGVydGllc19mcm9tX2RybV9kaXNwbGF5X21vZGUo
Cj4gIAlzdHJlYW0tPm91dF90cmFuc2Zlcl9mdW5jLT50eXBlID0gVEZfVFlQRV9QUkVERUZJTkVE
Owo+ICAJc3RyZWFtLT5vdXRfdHJhbnNmZXJfZnVuYy0+dGYgPSBUUkFOU0ZFUl9GVU5DVElPTl9T
UkdCOwo+ICAJaWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9UWVBFX0hETUlfVFlQRV9BKQo+
IC0JCWFkanVzdF9jb2xvdXJfZGVwdGhfZnJvbV9kaXNwbGF5X2luZm8odGltaW5nX291dCwgaW5m
byk7Cj4gKwkJYWRqdXN0X3RpbWluZ19mcm9tX2Rpc3BsYXlfaW5mbyh0aW1pbmdfb3V0LCBpbmZv
LCBtb2RlX2luKTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgZmlsbF9hdWRpb19pbmZvKHN0cnVj
dCBhdWRpb19pbmZvICphdWRpb19pbmZvLAo+IC0tIAo+IDIuMjQuMC40MzIuZzlkM2Y1ZjViNjMt
Z29vZwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
