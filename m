Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5CA58CC
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 16:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE0D89BF3;
	Mon,  2 Sep 2019 14:08:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D6389BF3
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 14:08:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q19so5940894wmc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Sep 2019 07:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ar+dnIzDNx50xhVpwBdIyXyU/dFEIi6L5cVXXWe6+O0=;
 b=s5lftrQS6pmmO9jjm9uXn77SDwLsnWxlzE/C8+eUiEfsQ0i7V+3KX5g0nNKU2X6OcF
 vhgZ7cRKfRmmVYp225hY+iJfrIEHXim6NDfWqvmOZ3n4McGq4Bz8tyJcjzfoMhdogxbj
 6Y9wyO/fBW3aESTUnM/3gIoh0BfwdEJ1QqaOiC9u4UwAucEKvGUsBgyj7cfbkvvKXuOM
 udXCB1f4nU3sGCoACs58ZYmfRijWNipoTVdPnWKUWzXzVx9FJPB0lj4i9oLGeLh4JEeK
 fM819AzMTETRhPOrgEiwVTuqirAmnXGr194jKIwBshH2+uDbkp8+8IKfF9K4h5VY7Ekm
 Vomw==
X-Gm-Message-State: APjAAAXj10bz5TcMYnub8CLg84HuGgUWLOGu8nlZ/mn4nMAs5sMJuOiB
 osKjxGLUvJlI8vgEFbXMoqX/H0gjfJwUGH+es/8=
X-Google-Smtp-Source: APXvYqxmvfR8O8kPzWd76XJRrXA2v0D7Kt16/QEWktXCcnKIomfeNyK53TSQhVJEOxYAjhRHE3OuAyEd1zIVi+9SL2Q=
X-Received: by 2002:a1c:ef18:: with SMTP id n24mr32598110wmh.29.1567433282867; 
 Mon, 02 Sep 2019 07:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190902105219.2813-1-christian.koenig@amd.com>
 <20190902105219.2813-3-christian.koenig@amd.com>
In-Reply-To: <20190902105219.2813-3-christian.koenig@amd.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Mon, 2 Sep 2019 10:07:51 -0400
Message-ID: <CAOWid-dhHxhuPRmz26POaFKnAo3LfvayGnEqA-wLCRn3kNsKsw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: remove amdgpu_cs_try_evict
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ar+dnIzDNx50xhVpwBdIyXyU/dFEIi6L5cVXXWe6+O0=;
 b=IlPmMbT0oQvC8ozAm92jKB3m+6TfxtzpbEl80kjpsR2L3bcYBf/m4ijFZZLTowzUKJ
 2/4K5Aq9nVT+A86xfjiMvc/EHSSk1WxDiajLo4QWKrg2We1VGOgcmQRtJ2dBxw2PGweF
 F+tO/Kn6i2Lj7oZPlqm99xt2z5aO0gyYOadERCrtuQmyCDfnXaTBJRFqjJj1WtGXPH1M
 PgazvRAxF11Cw+aWvNQHrxVBrCllfbo+JEUnOjb9zwhpeDBBqmbngUCHyAFeIAPMygfs
 tqP2oqZjA8l+vSDt9tJJS8AJQv5spBDgdLnyQ6IlTNQYlR6GEVinUy+SgIR8p+viAR5X
 bwwQ==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGV5IENocmlzdGlhbiwKCkNhbiB5b3UgZ28gaW50byBkZXRhaWxzIGEgYml0IG1vcmUgb24gdGhl
IGhvdyBhbmQgd2h5IHRoaXMgZG9lc24ndAp3b3JrIHdlbGwgYW55bW9yZT8gIChzdWNoIGFzIGl0
cyByZWxhdGlvbnNoaXAgd2l0aCBwZXIgVk0gQk9zPykgIEkgYW0KY3VyaW91cyB0byBsZWFybiBt
b3JlIGJlY2F1c2UgSSB3YXMgcmVhZGluZyBpbnRvIHRoaXMgY2h1bmsgb2YgY29kZQplYXJsaWVy
LiAgSXMgdGhpcyBzb21ldGhpbmcgdGhhdCB0aGUgU2hyaW5rZXIgQVBJIGNhbiBoZWxwIHdpdGg/
CgpSZWdhcmRzLApLZW5ueQoKT24gTW9uLCBTZXAgMiwgMjAxOSBhdCA2OjUyIEFNIENocmlzdGlh
biBLw7ZuaWcKPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IFRy
eWluZyB0byBldmljdCB0aGluZ3MgZnJvbSB0aGUgY3VycmVudCB3b3JraW5nIHNldCBkb2Vzbid0
IHdvcmsgdGhhdAo+IHdlbGwgYW55bW9yZSBiZWNhdXNlIG9mIHBlciBWTSBCT3MuCj4KPiBSZWx5
IG9uIHJlc2VydmluZyBWUkFNIGZvciBwYWdlIHRhYmxlcyB0byBhdm9pZCBjb250ZW50aW9uLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICB8ICAx
IC0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgfCA3MSArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3
MSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4gaW5kZXgg
YTIzNjIxM2Y4ZThlLi5kMTk5NTE1NjczM2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaAo+IEBAIC00NzgsNyArNDc4LDYgQEAgc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgewo+
ICAgICAgICAgdWludDY0X3QgICAgICAgICAgICAgICAgICAgICAgICBieXRlc19tb3ZlZF92aXNf
dGhyZXNob2xkOwo+ICAgICAgICAgdWludDY0X3QgICAgICAgICAgICAgICAgICAgICAgICBieXRl
c19tb3ZlZDsKPiAgICAgICAgIHVpbnQ2NF90ICAgICAgICAgICAgICAgICAgICAgICAgYnl0ZXNf
bW92ZWRfdmlzOwo+IC0gICAgICAgc3RydWN0IGFtZGdwdV9ib19saXN0X2VudHJ5ICAgICAqZXZp
Y3RhYmxlOwo+Cj4gICAgICAgICAvKiB1c2VyIGZlbmNlICovCj4gICAgICAgICBzdHJ1Y3QgYW1k
Z3B1X2JvX2xpc3RfZW50cnkgICAgIHVmX2VudHJ5Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jcy5jCj4gaW5kZXggZmQ5NWI1ODZiNTkwLi4wMzE4MmQ5NjhkM2QgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+IEBAIC00NDcsNzUgKzQ0NywxMiBA
QCBzdGF0aWMgaW50IGFtZGdwdV9jc19ib192YWxpZGF0ZShzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNl
ciAqcCwKPiAgICAgICAgIHJldHVybiByOwo+ICB9Cj4KPiAtLyogTGFzdCByZXNvcnQsIHRyeSB0
byBldmljdCBzb21ldGhpbmcgZnJvbSB0aGUgY3VycmVudCB3b3JraW5nIHNldCAqLwo+IC1zdGF0
aWMgYm9vbCBhbWRncHVfY3NfdHJ5X2V2aWN0KHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFtZGdwdV9ibyAqdmFsaWRh
dGVkKQo+IC17Cj4gLSAgICAgICB1aW50MzJfdCBkb21haW4gPSB2YWxpZGF0ZWQtPmFsbG93ZWRf
ZG9tYWluczsKPiAtICAgICAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IHRydWUs
IGZhbHNlIH07Cj4gLSAgICAgICBpbnQgcjsKPiAtCj4gLSAgICAgICBpZiAoIXAtPmV2aWN0YWJs
ZSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+IC0KPiAtICAgICAgIGZvciAoOyZw
LT5ldmljdGFibGUtPnR2LmhlYWQgIT0gJnAtPnZhbGlkYXRlZDsKPiAtICAgICAgICAgICAgcC0+
ZXZpY3RhYmxlID0gbGlzdF9wcmV2X2VudHJ5KHAtPmV2aWN0YWJsZSwgdHYuaGVhZCkpIHsKPiAt
Cj4gLSAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeSAqY2FuZGlkYXRl
ID0gcC0+ZXZpY3RhYmxlOwo+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9
IHR0bV90b19hbWRncHVfYm8oY2FuZGlkYXRlLT50di5ibyk7Cj4gLSAgICAgICAgICAgICAgIHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRldik7
Cj4gLSAgICAgICAgICAgICAgIGJvb2wgdXBkYXRlX2J5dGVzX21vdmVkX3ZpczsKPiAtICAgICAg
ICAgICAgICAgdWludDMyX3Qgb3RoZXI7Cj4gLQo+IC0gICAgICAgICAgICAgICAvKiBJZiB3ZSBy
ZWFjaGVkIG91ciBjdXJyZW50IEJPIHdlIGNhbiBmb3JnZXQgaXQgKi8KPiAtICAgICAgICAgICAg
ICAgaWYgKGJvID09IHZhbGlkYXRlZCkKPiAtICAgICAgICAgICAgICAgICAgICAgICBicmVhazsK
PiAtCj4gLSAgICAgICAgICAgICAgIC8qIFdlIGNhbid0IG1vdmUgcGlubmVkIEJPcyBoZXJlICov
Cj4gLSAgICAgICAgICAgICAgIGlmIChiby0+cGluX2NvdW50KQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+IC0KPiAtICAgICAgICAgICAgICAgb3RoZXIgPSBhbWRncHVfbWVt
X3R5cGVfdG9fZG9tYWluKGJvLT50Ym8ubWVtLm1lbV90eXBlKTsKPiAtCj4gLSAgICAgICAgICAg
ICAgIC8qIENoZWNrIGlmIHRoaXMgQk8gaXMgaW4gb25lIG9mIHRoZSBkb21haW5zIHdlIG5lZWQg
c3BhY2UgZm9yICovCj4gLSAgICAgICAgICAgICAgIGlmICghKG90aGVyICYgZG9tYWluKSkKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAtCj4gLSAgICAgICAgICAgICAgIC8q
IENoZWNrIGlmIHdlIGNhbiBtb3ZlIHRoaXMgQk8gc29tZXdoZXJlIGVsc2UgKi8KPiAtICAgICAg
ICAgICAgICAgb3RoZXIgPSBiby0+YWxsb3dlZF9kb21haW5zICYgfmRvbWFpbjsKPiAtICAgICAg
ICAgICAgICAgaWYgKCFvdGhlcikKPiAtICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
PiAtCj4gLSAgICAgICAgICAgICAgIC8qIEdvb2Qgd2UgY2FuIHRyeSB0byBtb3ZlIHRoaXMgQk8g
c29tZXdoZXJlIGVsc2UgKi8KPiAtICAgICAgICAgICAgICAgdXBkYXRlX2J5dGVzX21vdmVkX3Zp
cyA9Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhYW1kZ3B1X2dtY192cmFtX2Z1
bGxfdmlzaWJsZSgmYWRldi0+Z21jKSAmJgo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYW1kZ3B1X2JvX2luX2NwdV92aXNpYmxlX3ZyYW0oYm8pOwo+IC0gICAgICAgICAgICAgICBh
bWRncHVfYm9fcGxhY2VtZW50X2Zyb21fZG9tYWluKGJvLCBvdGhlcik7Cj4gLSAgICAgICAgICAg
ICAgIHIgPSB0dG1fYm9fdmFsaWRhdGUoJmJvLT50Ym8sICZiby0+cGxhY2VtZW50LCAmY3R4KTsK
PiAtICAgICAgICAgICAgICAgcC0+Ynl0ZXNfbW92ZWQgKz0gY3R4LmJ5dGVzX21vdmVkOwo+IC0g
ICAgICAgICAgICAgICBpZiAodXBkYXRlX2J5dGVzX21vdmVkX3ZpcykKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBwLT5ieXRlc19tb3ZlZF92aXMgKz0gY3R4LmJ5dGVzX21vdmVkOwo+IC0KPiAt
ICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KHIpKQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+IC0KPiAtICAgICAgICAgICAgICAgcC0+ZXZpY3RhYmxlID0gbGlzdF9wcmV2X2Vu
dHJ5KHAtPmV2aWN0YWJsZSwgdHYuaGVhZCk7Cj4gLSAgICAgICAgICAgICAgIGxpc3RfbW92ZSgm
Y2FuZGlkYXRlLT50di5oZWFkLCAmcC0+dmFsaWRhdGVkKTsKPiAtCj4gLSAgICAgICAgICAgICAg
IHJldHVybiB0cnVlOwo+IC0gICAgICAgfQo+IC0KPiAtICAgICAgIHJldHVybiBmYWxzZTsKPiAt
fQo+IC0KPiAgc3RhdGljIGludCBhbWRncHVfY3NfdmFsaWRhdGUodm9pZCAqcGFyYW0sIHN0cnVj
dCBhbWRncHVfYm8gKmJvKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAq
cCA9IHBhcmFtOwo+ICAgICAgICAgaW50IHI7Cj4KPiAtICAgICAgIGRvIHsKPiAtICAgICAgICAg
ICAgICAgciA9IGFtZGdwdV9jc19ib192YWxpZGF0ZShwLCBibyk7Cj4gLSAgICAgICB9IHdoaWxl
IChyID09IC1FTk9NRU0gJiYgYW1kZ3B1X2NzX3RyeV9ldmljdChwLCBibykpOwo+ICsgICAgICAg
ciA9IGFtZGdwdV9jc19ib192YWxpZGF0ZShwLCBibyk7Cj4gICAgICAgICBpZiAocikKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIHI7Cj4KPiBAQCAtNTU0LDkgKzQ5MSw2IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgYmluZGluZ191c2VycHRyID0gdHJ1ZTsKPiAgICAgICAgICAg
ICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgIGlmIChwLT5ldmljdGFibGUgPT0gbG9iaikKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBwLT5ldmljdGFibGUgPSBOVUxMOwo+IC0KPiAgICAgICAg
ICAgICAgICAgciA9IGFtZGdwdV9jc192YWxpZGF0ZShwLCBibyk7Cj4gICAgICAgICAgICAgICAg
IGlmIChyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByOwo+IEBAIC02NTksOSAr
NTkzLDYgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2JvcyhzdHJ1Y3QgYW1kZ3B1X2Nz
X3BhcnNlciAqcCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
cC0+Ynl0ZXNfbW92ZWRfdmlzX3RocmVzaG9sZCk7Cj4gICAgICAgICBwLT5ieXRlc19tb3ZlZCA9
IDA7Cj4gICAgICAgICBwLT5ieXRlc19tb3ZlZF92aXMgPSAwOwo+IC0gICAgICAgcC0+ZXZpY3Rh
YmxlID0gbGlzdF9sYXN0X2VudHJ5KCZwLT52YWxpZGF0ZWQsCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFtZGdwdV9ib19saXN0X2VudHJ5LAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR2LmhlYWQpOwo+Cj4gICAgICAgICBy
ID0gYW1kZ3B1X3ZtX3ZhbGlkYXRlX3B0X2JvcyhwLT5hZGV2LCAmZnByaXYtPnZtLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2NzX3ZhbGlkYXRlLCBwKTsK
PiAtLQo+IDIuMTcuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
