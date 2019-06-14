Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A1246353
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 17:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46616896A3;
	Fri, 14 Jun 2019 15:49:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCDC89A88
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 15:49:13 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m10so4139477edv.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 08:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=WMhGjxuVtuf0F8KDL3nbxQoc9njA9k3qau9tg2X3yAA=;
 b=QKgaSO60GOiG2mB6X/XhUtX2U0LzKuXSMzx/0vCDr66/gvLMUQNyT4BXVliL0l+B8D
 IYI0twPlAybk3ug1nCUqH9bC/t35hn4YwOhkRfE7UPaP/DHO15aeH3Ioxf7A1Fi+ZBY5
 fUGjvRiw4gteY5QzZqGdt/EfV8JpoVbpr+kGT7LtTo3pvJMQqLPmIfw3n21x4v7aIzm6
 yegNjkRs0rMAWYE4xHLfo4gCE0n3+iMfkE39FEkrwW5MSIRL5L/29nux4zTAkuUDQ4pz
 LTX4KhqXu7D0/fHJi/tARsqNJd6+Z4T7Wt+Ro93ASQxsFSj7uvKLZuekCX8ueHLKiR8o
 2b7A==
X-Gm-Message-State: APjAAAUd/JjcJSlIb13lWFEuwxUrl3NfxRpBivniBFC2bXITJAB1pmt4
 hDFeJVXCsiEm6YADka4BSyJszQ==
X-Google-Smtp-Source: APXvYqwqySG+ecseJcUqqDFe816zUE+/QDNkXq4GXIyUEuo8sgOjrHBH2z+X+n6BU9iVGGNS2h8WYg==
X-Received: by 2002:a50:90e7:: with SMTP id
 d36mr102011187eda.202.1560527352212; 
 Fri, 14 Jun 2019 08:49:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z22sm986362edz.6.2019.06.14.08.49.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 08:49:11 -0700 (PDT)
Date: Fri, 14 Jun 2019 17:49:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.2
Message-ID: <20190614154909.GD23020@phenom.ffwll.local>
References: <20190613021856.3307-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613021856.3307-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WMhGjxuVtuf0F8KDL3nbxQoc9njA9k3qau9tg2X3yAA=;
 b=ZFhug7pNQ7rl3MAs0kWexJPI2B3+yaBRjXRanM4ZRKaw1t7e2uKKTRwiNxXU5AVASf
 KSN2O1tQmJwBGk3RtomhEOnHtwFlBGgxEFzXmj6u8paYT05MJhY19jSYbMTTeWjhCwjg
 hLH4NJQ4l3sYmCnTMYUVSNs1pKvlmOMxZOo98=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDk6MTg6NTZQTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IEhpIERhdmUsIERhbmllbCwKPiAKPiBGaXhlcyBmb3IgNS4yOgo+IC0gRXh0ZW5kIHBy
ZXZpb3VzIHZjZSBmaXggZm9yIHJlc3VtZSB0byB1dmQgYW5kIHZjbgo+IC0gRml4IGJvdW5kcyBj
aGVja2luZyBpbiByYXMgZGVidWdmcyBpbnRlcmZhY2UKPiAtIEZpeCBhIHJlZ3Jlc3Npb24gb24g
U0kgdXNpbmcgYW1kZ3B1Cj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2
NzFlMmVlNWVlMjEyNzE3OWNhODg0YjQzOWFiNjAwMWE2MjNlZGQ2Ogo+IAo+ICAgTWVyZ2UgYnJh
bmNoICdsaW51eC01LjInIG9mIGdpdDovL2dpdGh1Yi5jb20vc2tlZ2dzYi9saW51eCBpbnRvIGRy
bS1maXhlcyAoMjAxOS0wNi0wNyAxNzoxNjowMCArMTAwMCkKClNvbWVob3cgbWlzc2VkIHRoaXMg
b25lLCBidXQganVzdCBmb3VuZCBpdCBiZWZvcmUgSSB3YW50ZWQgdG8gcHVzaCBvdXQgdGhlCi1m
aXhlcyBwdWxsIHRvIExpbnVzIC4uLgoKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKPiAKPiAgIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4
IGRybS1maXhlcy01LjIKClB1bGxlZCwgdGhhbmtzLgotRGFuaWVsCgo+IAo+IGZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byBmM2E1MjMxYzhmMTRhY2Q0Mjg0NWU5ZTYwZjUwNmI0ZTk0OGYw
ZTY4Ogo+IAo+ICAgZHJtL2FtZGdwdTogcmV0dXJuIDAgYnkgZGVmYXVsdCBpbiBhbWRncHVfcG1f
bG9hZF9zbXVfZmlybXdhcmUgKDIwMTktMDYtMTIgMjA6Mzk6NDkgLTA1MDApCj4gCj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IEFsZXggRGV1Y2hlciAoMSk6Cj4gICAgICAgZHJtL2FtZGdwdTogcmV0dXJuIDAgYnkgZGVm
YXVsdCBpbiBhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUKPiAKPiBEYW4gQ2FycGVudGVyICgx
KToKPiAgICAgICBkcm0vYW1kZ3B1OiBGaXggYm91bmRzIGNoZWNraW5nIGluIGFtZGdwdV9yYXNf
aXNfc3VwcG9ydGVkKCkKPiAKPiBTaGlyaXNoIFMgKDEpOgo+ICAgICAgIGRybS9hbWRncHUve3V2
ZCx2Y259OiBmZXRjaCByaW5nJ3MgcmVhZF9wdHIgYWZ0ZXIgYWxsb2MKPiAKPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgIHwgNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Zjbi5jIHwgNCArKystCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3V2ZF92Nl8wLmMgICB8IDUgKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZk
X3Y3XzAuYyAgIHwgNSArKysrLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
