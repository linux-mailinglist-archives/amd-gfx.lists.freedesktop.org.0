Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA079358416
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Apr 2021 15:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5166E19C;
	Thu,  8 Apr 2021 13:03:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A5A6E19C;
 Thu,  8 Apr 2021 13:03:52 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id d12so2033092oiw.12;
 Thu, 08 Apr 2021 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rt2BRHQZqUkT9bazOU3G77oNaEddpbuXevH4aAr87JM=;
 b=Zm4QffbBS14lf23oE2lSc/sXMvLasXgDO5jWQTIjxegB9ffJBG7lLH2QEpOkqaZ7WO
 IVO95ic+ydeHOvXUCosVdsD0YuFQR3RuCK47JlCzmT//2Bn2zQ7EZSyqbc3/QFEikXkA
 2LILrcT6AWM5TJ80auRT6E9O1AqcZ02ECjCFvxaFTPbOFfT7EgDaVpBtYV8nWdFsHb1+
 YeP6mTWJCOPOccrTZ7ep1tknXv6Pn2tRuA/ysvuLV6R8ao/oKsjlBMpCm0ACg4/aJjLE
 jXRGf57EgeouXY/bMqrRj9HEmwXL5zRzFBHktvI8JxGnRjKZ7R8Hpu+KLQNChUxa9Mvz
 MU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rt2BRHQZqUkT9bazOU3G77oNaEddpbuXevH4aAr87JM=;
 b=D640R+84JHcx0gd99Kfx/Ra8QfuO6Kub3sKJsxECyP4YWfkQrzuubjBeGtWBg1iWSW
 f5OiM/NPAGoIyW7APk60TvjK/bSf853eeN/afnJVuhv+RXiMvDeCYo9v9ZeIcdkVQRm5
 TcfT+/8BsPlPQTFubUj/7wQf6t5LBRxlCf7tv7yD8UNCG4PJRUKYMRprcQ5Ab/pwWgnM
 USQlhhHVpS2Zz84EljkIO/RONq/mAOdW0bHEwemtrlSrO1iw3hkahrNRSM5wRBG23WR4
 eILiquHWydO9CLkpvGW7Tlf+JTWpdejsNvrRqeD8AkDGyXlZU8CRS1+LEqrVwW9Wmp60
 LQ0g==
X-Gm-Message-State: AOAM530lFx1BzAb8vFh2Ok6sBxsH05oGzg4nD2Q3S1p+QMsGF3KTZgLY
 V0XuufeMtMh09uWbQpPojyCZq38RMnPWBbWAmZc=
X-Google-Smtp-Source: ABdhPJziQKDqh4Ga+KhmihbvA48hYkuc2h2kBTB4YoeduTXxWREF784ftTqmgv2lf9CM6H897WPdFELk2M5kQgAVytw=
X-Received: by 2002:a05:6808:68a:: with SMTP id
 k10mr5948947oig.120.1617887031712; 
 Thu, 08 Apr 2021 06:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210401222931.3823-1-alexander.deucher@amd.com>
 <0fa472a5-08b4-87cd-c295-7502bd30c2c0@gmail.com>
 <CADnq5_NXz-B3BjQdP1x7P3tPC160EO906_TZObJhx85CHt6b2A@mail.gmail.com>
 <CAPM=9twymi8Emi+GpDW0Gz_OQ63BGwwzKwF_Jxq8=i_VC9U=3w@mail.gmail.com>
 <CADnq5_Ored1NxmDP5=_-5BXstsTdUPB31upM2AVFLXM1EXKQzQ@mail.gmail.com>
 <d5cf9d27-471c-f89d-375a-be4a76a5debc@gmail.com>
 <18a67a9f-4199-ba39-d2a7-419d7993aac4@gmail.com>
In-Reply-To: <18a67a9f-4199-ba39-d2a7-419d7993aac4@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Apr 2021 09:03:40 -0400
Message-ID: <CADnq5_OLhO_En84yEeRsBDtMhJ4OY+7XJtgrjqUDrs-8_x7x0g@mail.gmail.com>
Subject: Re: [pull] amdgpu, radeon, ttm, sched drm-next-5.13
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgOCwgMjAyMSBhdCA2OjI4IEFNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEFtIDA4LjA0LjIxIHVtIDA5OjEz
IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiA+IEFtIDA3LjA0LjIxIHVtIDIxOjA0IHNjaHJp
ZWIgQWxleCBEZXVjaGVyOgo+ID4+IE9uIFdlZCwgQXByIDcsIDIwMjEgYXQgMzoyMyBBTSBEYXZl
IEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+PiBPbiBXZWQsIDcgQXByIDIw
MjEgYXQgMDY6NTQsIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPgo+ID4+PiB3
cm90ZToKPiA+Pj4+IE9uIEZyaSwgQXByIDIsIDIwMjEgYXQgMTI6MjIgUE0gQ2hyaXN0aWFuIEvD
tm5pZwo+ID4+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+
Pj4+PiBIZXkgQWxleCwKPiA+Pj4+Pgo+ID4+Pj4+IHRoZSBUVE0gYW5kIHNjaGVkdWxlciBjaGFu
Z2VzIHNob3VsZCBhbHJlYWR5IGJlIGluIHRoZSBkcm0tbWlzYy1uZXh0Cj4gPj4+Pj4gYnJhbmNo
IChub3QgMTAwJSBzdXJlIGFib3V0IHRoZSBUVE0gcGF0Y2gsIG5lZWQgdG8gZG91YmxlIGNoZWNr
Cj4gPj4+Pj4gbmV4dCB3ZWVrKS4KPiA+Pj4+Pgo+ID4+Pj4gVGhlIFRUTSBjaGFuZ2UgaXMgbm90
IGluIGRybS1taXNjIHlldC4KPiA+Pj4+Cj4gPj4+Pj4gQ291bGQgdGhhdCBjYXVzZSBwcm9ibGVt
cyB3aGVuIGJvdGggYXJlIG1lcmdlZCBpbnRvIGRybS1uZXh0Pwo+ID4+Pj4gRGF2ZSwgRGFuaWVs
LCBob3cgZG8geW91IHdhbnQgdG8gaGFuZGxlIHRoaXM/ICBUaGUgZHVwbGljYXRlZCBwYXRjaAo+
ID4+Pj4gaXMgdGhpcyBvbmU6Cj4gPj4+PiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9kcm0tbWlzYy9jb21taXQvP2lkPWFjNGViODNhYjI1NWRlOWMzMTE4NGRmNTFmZDE1MzRiYTM2
ZmQyMTIKPiA+Pj4+Cj4gPj4+PiBhbWRncHUgaGFzIGNoYW5nZXMgd2hpY2ggZGVwZW5kIG9uIGl0
LiAgVGhlIHNhbWUgcGF0Y2ggaXMgaW5jbHVkZWQKPiA+Pj4+IGluIHRoaXMgUFIuCj4gPj4+IE91
Y2ggbm90IHN1cmUgaG93IGJlc3QgdG8gc3luYyB1cCBoZXJlLCBtYXliZSBnZXQgbWlzYy1uZXh0
IGludG8gbXkKPiA+Pj4gdHJlZSB0aGVuIHJlYmFzZSB5b3VyIHRyZWUgb24gdG9wIG9mIGl0Pwo+
ID4+IEkgY2FuIGRvIHRoYXQuCj4gPgo+ID4gUGxlYXNlIGxldCBtZSBkb3VibGUgY2hlY2sgbGF0
ZXIgdG9kYXkgdGhhdCB3ZSBoYXZlIGV2ZXJ5dGhpbmcgd2UgbmVlZAo+ID4gaW4gZHJtLW1pc2Mt
bmV4dC4KPgo+IFRoZXJlIHdoZXJlIHR3byBwYXRjaCBmb3IgVFRNIChvbmUgZnJvbSBGZWxpeCBh
bmQgb25lIGZyb20gT2FrKSB3aGljaAo+IHN0aWxsIG5lZWRlZCB0byBiZSBwdXNoZWQgdG8gZHJt
LW1pc2MtbmV4dC4gSSd2ZSBkb25lIHRoYXQganVzdCBhIG1pbnV0ZQo+IGFnby4KPgoKVGhleSB3
ZXJlIGluY2x1ZGVkIGluIHRoaXMgUFIuCgo+Cj4gVGhlbiB3ZSBoYXZlIHRoaXMgcGF0Y2ggd2hp
Y2ggZml4ZXMgYSBidWcgaW4gY29kZSByZW1vdmVkIG9uCj4gZHJtLW1pc2MtbmV4dC4gSSB0aGlu
ayBpdCBzaG91bGQgYmUgZHJvcHBlZCB3aGVuIGFtZC1zdGFnaW5nLWRybS1uZXh0IGlzCj4gYmFz
ZWQgb24gZHJtLW5leHQvZHJtLW1pc2MtbmV4dC4KPgo+IEF1dGhvcjogeGluaHVpIHBhbiA8eGlu
aHVpLnBhbkBhbWQuY29tPgo+IERhdGU6ICAgV2VkIEZlYiAyNCAxMToyODowOCAyMDIxICswODAw
Cj4KPiAgICAgIGRybS90dG06IERvIG5vdCBhZGQgbm9uLXN5c3RlbSBkb21haW4gQk8gaW50byBz
d2FwIGxpc3QKPgoKT2suCgo+Cj4gSSd2ZSBhbHNvIGZvdW5kIHRoZSBmb2xsb3dpbmcgcGF0Y2gg
d2hpY2ggaXMgcHJvYmxlbWF0aWMgYXMgd2VsbDoKPgo+IGNvbW1pdCBjOGE5MjFkNDk0NDMwMjVl
MTA3OTQzNDJkNDQzM2IzZjI5NjE2NDA5Cj4gQXV0aG9yOiBKYWNrIFpoYW5nIDxKYWNrLlpoYW5n
MUBhbWQuY29tPgo+IERhdGU6ICAgTW9uIE1hciA4IDEyOjQxOjI3IDIwMjEgKzA4MDAKPgo+ICAg
ICAgZHJtL2FtZC9hbWRncHUgaW1wbGVtZW50IHRkciBhZHZhbmNlZCBtb2RlCj4KPiAgICAgIFtX
aHldCj4gICAgICBQcmV2aW91cyB0ZHIgZGVzaWduIHRyZWF0cyB0aGUgZmlyc3Qgam9iIGluIGpv
Yl90aW1lb3V0IGFzIHRoZSBiYWQgam9iLgo+ICAgICAgQnV0IHNvbWV0aW1lcyBhIGxhdGVyIGJh
ZCBjb21wdXRlIGpvYiBjYW4gYmxvY2sgYSBnb29kIGdmeCBqb2IgYW5kCj4gICAgICBjYXVzZSBh
biB1bmV4cGVjdGVkIGdmeCBqb2IgdGltZW91dCBiZWNhdXNlIGdmeCBhbmQgY29tcHV0ZSByaW5n
IHNoYXJlCj4gICAgICBpbnRlcm5hbCBHQyBIVyBtdXR1YWxseS4KPgo+ICAgICAgW0hvd10KPiAg
ICAgIFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBhbiBhZHZhbmNlZCB0ZHIgbW9kZS5JdCBpbnZvbHZl
cyBhbiBhZGRpdGluYWwKPiAgICAgIHN5bmNocm9ub3VzIHByZS1yZXN1Ym1pdCBzdGVwKFN0ZXAw
IFJlc3VibWl0KSBiZWZvcmUgbm9ybWFsIHJlc3VibWl0Cj4gICAgICBzdGVwIGluIG9yZGVyIHRv
IGZpbmQgdGhlIHJlYWwgYmFkIGpvYi4KPgo+ICAgICAgMS4gQXQgU3RlcDAgUmVzdWJtaXQgc3Rh
Z2UsIGl0IHN5bmNocm9ub3VzbHkgc3VibWl0cyBhbmQgcGVuZHMgZm9yIHRoZQo+ICAgICAgZmly
c3Qgam9iIGJlaW5nIHNpZ25hbGVkLiBJZiBpdCBnZXRzIHRpbWVvdXQsIHdlIGlkZW50aWZ5IGl0
IGFzIGd1aWx0eQo+ICAgICAgYW5kIGRvIGh3IHJlc2V0LiBBZnRlciB0aGF0LCB3ZSB3b3VsZCBk
byB0aGUgbm9ybWFsIHJlc3VibWl0IHN0ZXAgdG8KPiAgICAgIHJlc3VibWl0IGxlZnQgam9icy4K
Pgo+ICAgICAgMi4gRm9yIHdob2xlIGdwdSByZXNldCh2cmFtIGxvc3QpLCBkbyByZXN1Ym1pdCBh
cyB0aGUgb2xkIHdheS4KPgo+ICAgICAgU2lnbmVkLW9mZi1ieTogSmFjayBaaGFuZyA8SmFjay5a
aGFuZzFAYW1kLmNvbT4KPiAgICAgIFJldmlld2VkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5k
cmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPgo+IFRoYXQgb25lIGlzIG1vZGlmeWluZyBib3RoIGFt
ZGdwdSBhcyB3ZWxsIGFzIHRoZSBzY2hlZHVsZXIgY29kZS4gSUlSQyBJCj4gYWN0dWFsbHkgcmVx
dWVzdGVkIHRoYXQgdGhlIHBhdGNoIGlzIHNwbGl0IGludG8gdHdvLCBidXQgdGhhdCB3YXMKPiBz
b21laG93IG5vdCBkb25lLgo+Cj4gSG93IHNob3VsZCB3ZSBwcm9jZWVkIGhlcmU/IFNob3VsZCBJ
IHNlcGFyYXRlIHRoZSBwYXRjaCwgcHVzaCB0aGUKPiBjaGFuZ2VzIHRvIGRybS1taXNjLW5leHQg
YW5kIHRoZW4gd2UgbWVyZ2Ugd2l0aCBkcm0tbmV4dCBhbmQgcmViYXNlCj4gYW1kLXN0YWdpbmct
ZHJtLW5leHQgb24gdG9wIG9mIHRoYXQ/Cj4KPiBUaGF0J3MgbW9zdCBsaWtlbHkgdGhlIGNsZWFu
ZXN0IG9wdGlvbiBhcHByb2FjaCBhcyBmYXIgYXMgSSBjYW4gc2VlLgoKVGhhdCdzIGZpbmUgd2l0
aCBtZS4gIFdlIGNvdWxkIGhhdmUgaW5jbHVkZWQgdGhlbSBpbiBteSBQUi4gIE5vdyB3ZQpoYXZl
IHdhaXQgZm9yIGRybS1taXNjLW5leHQgdG8gYmUgbWVyZ2VkIGFnYWluIGJlZm9yZSB3ZSBjYW4g
bWVyZ2UgdGhlCmFtZGdwdSBjb2RlLiAgSXMgYW55b25lIHBsYW5uaW5nIHRvIGRvIGFub3RoZXIg
ZHJtLW1pc2MgbWVyZ2UgYXQgdGhpcwpwb2ludD8KCkFsZXgKCj4KPiBUaGFua3MsCj4gQ2hyaXN0
aWFuLgo+Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENocmlzdGlhbi4KPiA+Cj4gPj4KPiA+PiBBbGV4
Cj4gPj4KPiA+Pgo+ID4+PiBEYXZlLgo+ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
