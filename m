Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF854D3CE
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 18:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7134E6E5D3;
	Thu, 20 Jun 2019 16:32:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179826E5CF;
 Thu, 20 Jun 2019 16:32:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m3so3728569wrv.2;
 Thu, 20 Jun 2019 09:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/nAWwlVU5pWdSOrCAQBBC/uMKG2COQGm0gZgKWU6JP4=;
 b=XV2KJbsqgtfd6LoVZ5ksgxbXM0EsLhxXuJfUFTdhZYD6ADO1Waa3h6WjR8WPXmjCuH
 y3MUAgOpkrKveR53jsVm84Oj5GdkaaPh0i2MAZ8vwA4+N7/PxoRZ0Mzk1Vxa4oWV7T4q
 +hyUgjahflTRERHwa5FwyITsvRjrJUS6BaIWiJysVAEwaJH17gYXSgdd06W6pEiDC315
 zC0SW6PbIgEgt/5viqPVyEAbOg0xgRZjGj7022fnp+Pu+qxbe7fbZwR6fdsZb8NcQEAW
 kgVubNzcSYbfPslfI0lFTSmWjK4+p94jTqW/HoJFVgdLsrrAW4WebOLm5fa7Bjj7cTKG
 Xvtw==
X-Gm-Message-State: APjAAAUvQfDiuy4MZ+CLwUtI7zVcS8QhUBvPGWuBLoe9h8XFLMX6LRzM
 aafy4vka8NcSuWF9cpbWyHU=
X-Google-Smtp-Source: APXvYqz0jtZokioxtpffIliv4NfsOgtHYHrUMrjpkrfiK7i4qIXZ8FttQOiEWhudtKOQif5ZVu884g==
X-Received: by 2002:adf:f44f:: with SMTP id f15mr25284317wrp.198.1561048339703; 
 Thu, 20 Jun 2019 09:32:19 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id h84sm12856wmf.43.2019.06.20.09.32.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 09:32:19 -0700 (PDT)
Date: Thu, 20 Jun 2019 17:30:12 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190620163012.GF1896@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/nAWwlVU5pWdSOrCAQBBC/uMKG2COQGm0gZgKWU6JP4=;
 b=d/UnKldNPxcXJjD6kEIowRV9s8d3AkIWxTPxmgMfYHKDl2blMOgqEAx0rUxXspP6yi
 4VMvg1LqJz/Wv/Jr4msFL7DpNqihaqJZsA85hPvv1XAazSHJ+W9vjmpLf1EAV/PEqsh5
 2gCeSTgUH5CUDLpH+xrmQ4GhCeSq96bJjOOpiPb/sp75t9b/XH1Mx1Yls64NSsfjOHNE
 63zFTgr0L05bQtcm8tjxI/LJNrpZ1cqTH5kGaKzlvDlnrN6/woZQ6udvJ6a4f1dR/r17
 zcU7J13yeZw9iUSKN7l6VYZJnbNZwiqVMzH5YGvL/ZIcdB/iuHrQ79lxVqDh4Vdxb2rT
 Iw4A==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xNCwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMTQuMDYuMTkgdW0g
MTc6NTMgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiBPbiAyMDE5LzA2LzE0LCBLb2VuaWcsIENo
cmlzdGlhbiB3cm90ZToKPiA+PiBBbSAxNC4wNi4xOSB1bSAxNDowOSBzY2hyaWViIEVtaWwgVmVs
aWtvdjoKPiA+Pj4gT24gMjAxOS8wNS8yNywgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4+PiBbU05J
UF0KPiA+Pj4gSGkgQ2hyaXN0aWFuLAo+ID4+Pgo+ID4+Pgo+ID4+PiBJbiB0aGUgZm9sbG93aW5n
LCBJIHdvdWxkIGxpa2UgdG8gc3VtbWFyaXNlIGFuZCBlbXBoYXNpemUgdGhlIG5lZWQgZm9yCj4g
Pj4+IERSTV9BVVRIIHJlbW92YWwuIEkgd291bGQga2luZGx5IGFzayB5b3UgdG8gc3BlbmQgYSBj
b3VwbGUgb2YgbWludXRlcwo+ID4+PiBleHRyYSByZWFkaW5nIGl0Lgo+ID4+Pgo+ID4+Pgo+ID4+
PiBUb2RheSBEUk0gZHJpdmVycyogZG8gbm90IG1ha2UgYW55IGRpc3RpbmN0aW9uIGJldHdlZW4g
cHJpbWFyeSBhbmQKPiA+Pj4gcmVuZGVyIG5vZGUgY2xpZW50cy4KPiA+PiBUaGF0IGlzIGFjdHVh
bGx5IG5vdCAxMDAlIGNvcnJlY3QuIFdlIGhhdmUgYSBzcGVjaWFsIGNhc2Ugd2hlcmUgYSBEUk0K
PiA+PiBtYXN0ZXIgaXMgYWxsb3dlZCB0byBjaGFuZ2UgdGhlIHByaW9yaXR5IG9mIHJlbmRlciBu
b2RlIGNsaWVudHMuCj4gPj4KPiA+IENhbiB5b3UgcHJvdmlkZSBhIGxpbms/IEkgY2Fubm90IGZp
bmQgdGhhdCBjb2RlLgo+IAo+IFNlZSBhbWRncHVfc2NoZWRfaW9jdGwoKS4KPiAKPiA+Pj4gVGh1
cyBmb3IgYSByZW5kZXIgY2FwYWJsZSBkcml2ZXIsIGFueSBwcmVtaXNlIG9mCj4gPj4+IHNlcGFy
YXRpb24sIHNlY3VyaXR5IG9yIG90aGVyd2lzZSBpbXBvc2VkIHZpYSBEUk1fQVVUSCBpcyBhIGZh
bGxhY3kuCj4gPj4gWWVhaCwgdGhhdCdzIHdoYXQgSSBhZ3JlZSBvbi4gSSBqdXN0IGRvbid0IHRo
aW5rIHRoYXQgcmVtb3ZpbmcgRFJNX0FVVEgKPiA+PiBub3cgaXMgdGhlIHJpZ2h0IGRpcmVjdGlv
biB0byB0YWtlLgo+ID4+Cj4gPiBDb3VsZCBoYXZlIGJlZW4gY2xlYXJlciAtIEknbSB0YWxraW5n
IGFib3V0IERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVwo+ID4gaW9jdGxzLgo+ID4KPiA+IFRo
YXQgYXNpZGUsIGNhbiB5b3UgcHJvcG9zZSBhbiBhbHRlcm5hdGl2ZSBzb2x1dGlvbiB0aGF0IGFk
ZHJlc3NlcyB0aGlzCj4gPiBhbmQgdGhlIHNlY29uZCBwb2ludCBqdXN0IGJlbG93Pwo+IAo+IEdp
dmUgbWUgYSBmZXcgZGF5cyB0byB3b3JrIG9uIHRoaXMsIGl0J3MgYWxyZWFkeSBGcmlkYXkgNnBt
IGhlcmUuCj4gCkhpIENocmlzdGlhbiwKCkFueSBwcm9ncmVzcz8gQXMgbWVudGlvbmVkIGVhcmxp
ZXIsIEknbSBPSyB3aXRoIHdyaXRpbmcgdGhlIHBhdGNoZXMgYWx0aG91Z2gKSSB3b3VsZCBsb3Zl
IHRvIGhlYXIgeW91ciBwbGFuLgoKVGhhbmtzCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
