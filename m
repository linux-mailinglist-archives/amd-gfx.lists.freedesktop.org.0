Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DD2E568
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 21:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5A06E0EF;
	Wed, 29 May 2019 19:34:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF426E0CC
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 19:34:14 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g13so5429691edu.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 12:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=e3Kr0K8g8bipdk24nKrYx+/rMshypa+JV5/pa2b6F2g=;
 b=dheCjwHD8IrxwORxnEzOw43pUJt0Ca/x/tpiBbZd8Uo4F/ykKiU6v2H21gp0eIWRWw
 j/3xQ96jw+OUjOPuhcYjJblWkwsojZamFeYn8Cp1v2wA5Wb8NbF6KBpO4mFO5lptlH73
 rrj4r/99CkMHJ3asULKIREu0Y/vNV+ChVljEsGV5UcyMUYUuzPld1wr4JnxSfKlxQJJ3
 Zu3LiXXCGQBNioMeuDefNbUG27ZuYY6Mt5eVp5JNASHtGEoZENhxbaziT5H/s3ud/SlZ
 JMOLjBhFdz74n/eq52j6pJzevEHtxe5WoW9IOw2ZC+3vpkUx+S2mQ3ck7kuACoKkhw0G
 hUiw==
X-Gm-Message-State: APjAAAWL2EIeuSxRXXqDc6C4+lfz9g7EdihNghLGw/9VYl9XR7c1GCKv
 vZ1YN1MrIZ0EC2u11mVhn0yGeA==
X-Google-Smtp-Source: APXvYqwAk7FE/Qx6pYoZX9i5Y3ySPN8vPhLDQMQ6fxIfH4/d+XkMI0YEnUL7q2GHhY3wmbiFChWEDQ==
X-Received: by 2002:a17:906:606:: with SMTP id
 s6mr97233406ejb.192.1559158453223; 
 Wed, 29 May 2019 12:34:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w6sm76187ejf.0.2019.05.29.12.34.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 12:34:11 -0700 (PDT)
Date: Wed, 29 May 2019 21:34:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH] drm/sched: Fix make htmldocs warnings.
Message-ID: <20190529193409.GW21222@phenom.ffwll.local>
References: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e3Kr0K8g8bipdk24nKrYx+/rMshypa+JV5/pa2b6F2g=;
 b=arupSZ3XW9gOnToHPWkaPzZEqE8EbG64giIx577Sy4OazM4+FtXu1X7Zcy5SKObRwm
 mQZzbf24/nCXVorKrBZDkopedkj7WiY58neGmW+dvTNLGatNsJDPzqUKXfto4kJHM/uh
 IjgvTzJu+4cVeg9hnFnB2AGFpMpDIxwAd1F90=
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
Cc: daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6Mjk6NDBBTSAtMDQwMCwgQW5kcmV5IEdyb2R6b3Zz
a3kgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9k
em92c2t5QGFtZC5jb20+CgpUaGFua3MgZm9yIHF1aWNrIGZpeGluZyEKCkFja2VkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IGlu
ZGV4IDQ5ZTdkMDcuLmMxMDU4ZWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYwo+IEBAIC0zNTMsNiArMzUzLDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5j
cmVhc2Vfa2FybWEpOwo+ICAgKiBkcm1fc2NoZWRfc3RvcCAtIHN0b3AgdGhlIHNjaGVkdWxlcgo+
ICAgKgo+ICAgKiBAc2NoZWQ6IHNjaGVkdWxlciBpbnN0YW5jZQo+ICsgKiBAYmFkOiBqb2Igd2hp
Y2ggY2F1c2VkIHRoZSB0aW1lIG91dAo+ICAgKgo+ICAgKiBTdG9wIHRoZSBzY2hlZHVsZXIgYW5k
IGFsc28gcmVtb3ZlcyBhbmQgZnJlZXMgYWxsIGNvbXBsZXRlZCBqb2JzLgo+ICAgKiBOb3RlOiBi
YWQgam9iIHdpbGwgbm90IGJlIGZyZWVkIGFzIGl0IG1pZ2h0IGJlIHVzZWQgbGF0ZXIgYW5kIHNv
IGl0J3MKPiBAQCAtNDIyLDYgKzQyMyw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX3N0b3Ap
Owo+ICAgKiBkcm1fc2NoZWRfam9iX3JlY292ZXJ5IC0gcmVjb3ZlciBqb2JzIGFmdGVyIGEgcmVz
ZXQKPiAgICoKPiAgICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UKPiArICogQGZ1bGxfcmVj
b3Zlcnk6IHByb2NlZWQgd2l0aCBjb21wbGV0ZSBzY2hlZCByZXN0YXJ0Cj4gICAqCj4gICAqLwo+
ICB2b2lkIGRybV9zY2hlZF9zdGFydChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLCBi
b29sIGZ1bGxfcmVjb3ZlcnkpCj4gLS0gCj4gMi43LjQKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
