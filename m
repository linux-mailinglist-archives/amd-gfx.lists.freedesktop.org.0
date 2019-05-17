Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294C21AA9
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 17:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8467E8992E;
	Fri, 17 May 2019 15:36:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc31.google.com (mail-yw1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E54D8992E
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 15:36:09 +0000 (UTC)
Received: by mail-yw1-xc31.google.com with SMTP id e74so2900140ywe.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 08:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2sL0TtZ1/OGzI6zVGerxkhqktIUwO112Xx/XwckzPM=;
 b=mfqNSb7YBpHUSyAXs3pT92++Ct/ljUrzA3ywrZN6TXW3yElo5rOUrWkvCSkBa4NWN8
 gxXODmsoIps3733PL+4dlYezLiI+ZB1uaQA65M4X9tGco1ZMZvBdesq8tE+nEO6NrE//
 wX8l5dTWlk3yUa10CLfwJtyhCZKuzqay7cKPZQaSlXV+1FXsUqa/SDUJbfnRGcfrt81l
 LnXBsjCvgtQZWVmdnBWkIU7keV8aZMwyRhRBpEdK8zgg2Dt2n7dfn/SyCe8fNfBAcd5o
 wsQ//9FfKSlj0ObdWMgwhRUdy8pt/XHXO8FMdyuHZMHVvsFYuON2WHm8qvXNejwsFs+e
 0iGQ==
X-Gm-Message-State: APjAAAWntsTejDakLwfS3sdGAsk9O/XL7sSNUNQ8HJ26Gm3Q8kSI/EII
 SVMs8V7PrGDGPkjdWWLZtcby38jQpgK7dSxz84Nrdw==
X-Google-Smtp-Source: APXvYqxAhiNnngDVxbcltlqeOPMY0BU42vJUczkzViqOcqjKEBz4oUVotpd7AzM220gOfZj7powxwa43mTupcsPyHH4=
X-Received: by 2002:a81:5cc5:: with SMTP id
 q188mr28754034ywb.105.1558107368188; 
 Fri, 17 May 2019 08:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-EccO1ue5hTtJ8m4utQp+8dSsWm60JFA5YOT1gCODnYcFUog@mail.gmail.com>
 <CADnq5_N=-cWz99T4ma_=6-_bu-Ty2twsFt=KGtzTdWn1hcDSrA@mail.gmail.com>
 <CAJ-EccOH2dXPD+XeHQcqZYD+xa2eB6SVp6oFk4AD0vy=H+9+0w@mail.gmail.com>
 <CADnq5_OTk4nE4G6FHmSRmvNLNO4hJbVC9cuxAiGEZk1_b2C=9w@mail.gmail.com>
In-Reply-To: <CADnq5_OTk4nE4G6FHmSRmvNLNO4hJbVC9cuxAiGEZk1_b2C=9w@mail.gmail.com>
From: Micah Morton <mortonm@chromium.org>
Date: Fri, 17 May 2019 08:35:56 -0700
Message-ID: <CAJ-EccPFdxNTe5ESwJDg0MKSZasigkcg9CjxN__MgXaF2RURQw@mail.gmail.com>
Subject: Re: GPU passthrough support for Stoney [Radeon R2/R3/R4/R5 Graphics]?
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=a2sL0TtZ1/OGzI6zVGerxkhqktIUwO112Xx/XwckzPM=;
 b=cdKEev31RtY1LQOynaV1Rdr/E9HChThrbnxPUP9/YURIvpOG0DiMHJPGy8tRSXJ566
 wJa9iNtSKHMihe1rMhpncGFkhrgsFZlhUK4hoxHgu/msFcSih3ebY1CXSdvTLiX9sAlp
 XL50ZbJdxVwxPE9oeGhJpCh/S3kh/UsqFfNB0=
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

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTozOSBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCA0OjA3IFBNIE1p
Y2FoIE1vcnRvbiA8bW9ydG9ubUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
TWF5IDE1LCAyMDE5IGF0IDc6MTkgUE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5j
b20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAyOjI2IFBNIE1p
Y2FoIE1vcnRvbiA8bW9ydG9ubUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
SGkgZm9sa3MsCj4gPiA+ID4KPiA+ID4gPiBJJ20gaW50ZXJlc3RlZCBpbiBydW5uaW5nIGEgVk0g
b24gYSBzeXN0ZW0gd2l0aCBhbiBpbnRlZ3JhdGVkIFN0b25leQo+ID4gPiA+IFtSYWRlb24gUjIv
UjMvUjQvUjUgR3JhcGhpY3NdIGNhcmQgYW5kIHBhc3NpbmcgdGhyb3VnaCB0aGUgZ3JhcGhpY3MK
PiA+ID4gPiBjYXJkIHRvIHRoZSBWTSB1c2luZyB0aGUgSU9NTVUuIEknbSB3b25kZXJpbmcgd2hl
dGhlciB0aGlzIGlzIGZlYXNpYmxlCj4gPiA+ID4gYW5kIHN1cHBvc2VkIHRvIGJlIGRvYWJsZSB3
aXRoIHRoZSByaWdodCBzZXR1cCAoYXMgb3Bwb3NlZCB0byBwYXNzaW5nCj4gPiA+ID4gYSBkaXNj
cmV0ZSBHUFUgdG8gdGhlIFZNLCB3aGljaCBJIHRoaW5rIGlzIGRlZmluaXRlbHkgZG9hYmxlPyku
Cj4gPiA+ID4KPiA+ID4gPiBTbyBmYXIsIEkgY2FuIGRvIGFsbCB0aGUgcWVtdS9rdm0vdmZpby9p
b21tdSBzdHVmZiB0byBydW4gdGhlIFZNIGFuZAo+ID4gPiA+IHBhc3MgdGhlIGludGVncmF0ZWQg
R1BVIHRvIGl0LCBidXQgdGhlIGRybSBkcml2ZXIgaW4gdGhlIFZNIGZhaWxzCj4gPiA+ID4gZHVy
aW5nIGFtZGdwdV9kZXZpY2VfaW5pdCgpLiBTcGVjaWZpY2FsbHksIHRoZSBsb2dzIHNob3cgdGhl
IFNNVSBiZWluZwo+ID4gPiA+IHVucmVzcG9uc2l2ZSwgd2hpY2ggbGVhZHMgdG8gYSAnU01VIGZp
cm13YXJlIGxvYWQgZmFpbGVkJyBlcnJvcgo+ID4gPiA+IG1lc3NhZ2UgYW5kIGtlcm5lbCBwYW5p
Yy4gSSBjYW4gc2hhcmUgVk0gbG9ncyBhbmQgdGhlIGludm9jYXRpb24gb2YKPiA+ID4gPiBxZW11
IGFuZCBzdWNoIGlmIGhlbHBmdWwsIGJ1dCBmaXJzdCB3YW50ZWQgdG8ga25vdyBhdCBhIGhpZ2gg
bGV2ZWwgaWYKPiA+ID4gPiB0aGlzIHNob3VsZCBiZSBmZWFzaWJsZT8KPiA+ID4gPgo+ID4gPiA+
IFAuUy46IEknbSBub3QgaW5pdGlhbGl6aW5nIHRoZSBHUFUgaW4gdGhlIGhvc3QgYmlvcyBvciBo
b3N0IGtlcm5lbCBhdAo+ID4gPiA+IGFsbCwgc28gSSBzaG91bGQgYmUgcGFzc2luZyBhIGZyZXNo
IEdQVSB0byB0aGUgVk0uIEFsc28sIEknbSBwcmV0dHkKPiA+ID4gPiBzdXJlIEknbSBydW5uaW5n
IHRoZSBjb3JyZWN0IFZHQSBiaW9zIGZvciB0aGlzIEdQVSBpbiB0aGUgZ3Vlc3QgVk0KPiA+ID4g
PiBiaW9zIGJlZm9yZSBndWVzdCBib290Lgo+ID4gPiA+Cj4gPiA+ID4gQW55IGNvbW1lbnRzL3N1
Z2dlc3Rpb25zIHdvdWxkIGJlIGFwcHJlY2lhdGVkIQo+ID4gPgo+ID4gPiBJdCBzaG91bGQgd29y
ayBpbiBhdCBsZWFzdCBvbmNlIGFzIGxvbmcgYXMgeW91ciB2bSBpcyBwcm9wZXJseSBzZXQgdXAu
Cj4gPgo+ID4gSXMgdGhlcmUgYW55IHJlYXNvbiBydW5uaW5nIGNvcmVib290IHZzIFVFRkkgYXQg
aG9zdCBib290IHdvdWxkIG1ha2UgYQo+ID4gZGlmZmVyZW5jZT8gSSB3YXMgcnVubmluZyBhIG1v
ZGlmaWVkIHZlcnNpb24gb2YgY29yZWJvb3QgdGhhdCBhdm9pZHMKPiA+IGRvaW5nIGFueSBHUFUg
aW5pdGlhbGl6YXRpb24gaW4gZmlybXdhcmUgLS0gc28gdGhlIGZpcnN0IFBPU1QgaGFwcGVucwo+
ID4gaW5zaWRlIHRoZSBndWVzdC4KPgo+IFRoZSBHUFUgb24gQVBVcyBzaGFyZXMgYSBidW5jaCBv
ZiByZXNvdXJjZXMgd2l0aCB0aGUgQ1BVLiAgVGhlcmUgYXJlIGEKPiBidW5jaCBvZiBibG9ja3Mg
d2hpY2ggYXJlIHNoYXJlZCBhbmQgbmVlZCB0byBiZSBpbml0aWFsaXplZCBvbiBib3RoCj4gZm9y
IGV2ZXJ5dGhpbmcgdG8gd29yayBwcm9wZXJseS4KCkludGVyZXN0aW5nLiBTbyBza2lwcGluZyBy
dW5uaW5nIHRoZSB2YmlvcyBpbiB0aGUgaG9zdCBhbmQgd2FpdGluZwp1bnRpbCBydW5uaW5nIGl0
IGZvciB0aGUgZmlyc3QgdGltZSBpbiB0aGUgZ3Vlc3QgU2VhQklPUyBpcyBhIGJhZAppZGVhPyBX
b3VsZCBpdCBiZSBiZXR0ZXIgdG8gbGV0IEFQVStDUFUgaW5pdGlhbGl6ZSBub3JtYWxseSBpbiB0
aGUKaG9zdCBhbmQgdGhlbiBza2lwIHRyeWluZyB0byBydW4gdGhlIHZiaW9zIGluIGd1ZXN0IFNl
YUJJT1MgYW5kIGp1c3QKZG8gc29tZSBraW5kIG9mIHJlc2V0IGJlZm9yZSB0aGUgZHJtIGRyaXZl
ciBzdGFydHMgYWNjZXNzaW5nIGl0IGZyb20KdGhlIGd1ZXN0PwoKPgo+ID4KPiA+ID4gTm90ZSB0
aGF0IHRoZSBkcml2ZXIgbmVlZHMgYWNjZXNzIHRvIHRoZSB2YmlvcyBpbWFnZSBpbiB0aGUgZ3Vl
c3QgdG8KPiA+ID4gZ2V0IGRldmljZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uIGRldGFpbHMgKGNs
b2NrcywgZGlzcGxheSBjb25uZWN0b3IKPiA+ID4gY29uZmlndXJhdGlvbiwgZXRjLikuCj4gPgo+
ID4gSXMgdGhlcmUgYW55dGhpbmcgSSBuZWVkIHRvIGRvIHRvIGVuc3VyZSB0aGlzIGJlc2lkZXMg
cGFzc2luZyAnLWRldmljZQo+ID4gdmZpby1wY2ksLi4uLHJvbWZpbGU9L3BhdGgvdG8vdmdhcm9t
JyB0byBxZW11Pwo+Cj4gWW91IG5lZWQgdGhlIGFjdHVhbCB2YmlvcyByb20gaW1hZ2UgZnJvbSB5
b3VyIHN5c3RlbS4gIFRoZSBpbWFnZSBpcwo+IGJvYXJkIHNwZWNpZmljLgoKSSBzaG91bGQgaGF2
ZSB0aGUgY29ycmVjdCB2YmlvcyByb20gaW1hZ2UgZm9yIG15IGJvYXJkLiBJJ20gZXh0cmFjdGlu
ZwppdCBmcm9tIHRoZSBmaXJtd2FyZSBpbWFnZSAodGhhdCB3b3JrcyBmb3IgcmVndWxhciBncmFw
aGljcyBpbml0CndpdGhvdXQgdGhpcyBWTSBzdHVmZikgZm9yIHRoZSBib2FyZCBhdCBidWlsZCB0
aW1lIChyYXRoZXIgdGhhbgpncmFiYmluZyBpdCBmcm9tIC9zeXMvZGV2aWNlcy9wY2kuLi4gYXQg
cnVudGltZSksIHNvIGl0IHNob3VsZG4ndCBiZQptb2RpZmllZCBvciBjb3JydXB0ZWQgaW4gYW55
IHdheS4KCj4KPiBBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
