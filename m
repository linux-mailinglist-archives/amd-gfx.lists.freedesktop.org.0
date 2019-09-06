Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F85AB4AD
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 11:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266726E1F8;
	Fri,  6 Sep 2019 09:12:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74836E1F4
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Sep 2019 09:12:44 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c19so5604194edy.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 06 Sep 2019 02:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=8pEqT/7PVhOn5E1RdOfZNt4oxSI4VkCztNjkHiJeFiY=;
 b=Z00S87H2umnhZmGTSVA+39VOuHclxGVKRoky+KBW5HSFipbtEE02UmXSXETHZvHHL2
 f7n7WCmKZjAcZ/+zyLXj+EA64R7wXz8qvkLh7avGPop5HdWIKFpegdXJf2yJvD+90pjw
 muAZZ8jshfSDOhKXOKXDq9jlFqcovWg0Dn75fG8S6d3ksNEKfiKArmo7oQrwmQVVhYFC
 ziAv/cOYE2laK9K0/D/lfpqe1R0KFWSYerbvh/A69QQeEs6xD6DudtmdicQbKZRqN4/X
 8qJPma6sLtMsL++yNepjbp8jRFlHhg70/4630vUg+bjJF2tUBG6ONQcoi4JNimnkgYfX
 fXFg==
X-Gm-Message-State: APjAAAUKFl3BEWc3BG9lEg+hVPxOTsDFH3SJf8Z6IjdHRtilOZdYKZhG
 pEICKOc37EqkOsILVU/HtKxKqA==
X-Google-Smtp-Source: APXvYqzl/nleXKkE9hdjksK2Ymyu6lmcILfEkJq8BVbCQj4bR/80R37+Lw/J5Ykrq9sWREIA/hAdFQ==
X-Received: by 2002:aa7:ca41:: with SMTP id j1mr8291121edt.63.1567761163294;
 Fri, 06 Sep 2019 02:12:43 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j1sm215348ejc.13.2019.09.06.02.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 02:12:42 -0700 (PDT)
Date: Fri, 6 Sep 2019 11:12:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH RFC v4 01/16] drm: Add drm_minor_for_each
Message-ID: <20190906091240.GB3958@phenom.ffwll.local>
References: <20190903075719.GK2112@phenom.ffwll.local>
 <CAOWid-dxxDhyxP2+0R0oKAk29rR-1TbMyhshR1+gbcpGJCAW6g@mail.gmail.com>
 <CAKMK7uEofjdVURu+meonh_YdV5eX8vfNALkW3A_+kLapCV8j+w@mail.gmail.com>
 <CAOWid-eUVztW4hNVpznnJRcwHcjCirGL2aS75p4OY8XoGuJqUg@mail.gmail.com>
 <20190904085434.GF2112@phenom.ffwll.local>
 <CAOWid-fiEOmPw1z=aF6E4VE03xikREKt-X8VVKGGUGBQd3i=Kw@mail.gmail.com>
 <CAKMK7uGSrscs-WAv0pYfcxaUGXvx7M6JYbiPHTY=1hxRbFK1sg@mail.gmail.com>
 <CAOWid-eRZGxWzHw4qFqtSOCixQXvY4bEP91QnVH0Nmm13J9F-g@mail.gmail.com>
 <CAKMK7uHy+GRAcpLDuz6STCBW+GNfNWr-i=ZERF3uqkO7jfynnQ@mail.gmail.com>
 <CAOWid-cRP1T2gr2U_ZN+QhS7jFM0kFTWiYy8JPPXXmGW7xBPzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-cRP1T2gr2U_ZN+QhS7jFM0kFTWiYy8JPPXXmGW7xBPzA@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8pEqT/7PVhOn5E1RdOfZNt4oxSI4VkCztNjkHiJeFiY=;
 b=WPdT/JVxl7Dt9NVmLhjoXgL48l1X+TvNqNDy9dHcH8vfUaLdt4QEEFFJClMquLVwuN
 RV77Hq/Oo7P+6hmVXsBoQTlqK0H9SJX8djO6rGLa5WFkBTU5SrhCBMIgQBcXM+VkxPoS
 e6p0KgpYhvrPR0heyT7/katg1/W8HDChjE8XY=
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
Cc: "Greathouse, Joseph" <joseph.greathouse@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDU6MjY6MDhQTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gVGh1LCBTZXAgNSwgMjAxOSBhdCA0OjMyIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4gd3JvdGU6Cj4gPgo+ICpzbmlwKgo+ID4gZHJtX2Rldl91bnJlZ2lzdGVyIGdldHMg
Y2FsbGVkIG9uIGhvdHVucGx1Zywgc28geW91ciBjZ3JvdXAtaW50ZXJuYWwKPiA+IHRyYWNraW5n
IHdvbid0IGdldCBvdXQgb2Ygc3luYyBhbnkgbW9yZSB0aGFuIHRoZSBkcm1fbWlub3IgbGlzdCBn
ZXRzCj4gPiBvdXQgb2Ygc3luYyB3aXRoIGRybV9kZXZpY2VzLiBUaGUgdHJvdWJsZSB3aXRoIGRy
bV9taW5vciBpcyBqdXN0IHRoYXQKPiA+IGNncm91cCBkb2Vzbid0IHRyYWNrIGFsbG9jYXRpb25z
IG9uIGRybV9taW5vciAodGhhdCdzIGp1c3QgdGhlIHVhcGkKPiA+IGZsYXZvdXIpLCBidXQgb24g
dGhlIHVuZGVybHlpbmcgZHJtX2RldmljZS4gU28gcmVhbGx5IGRvZXNuJ3QgbWFrZQo+ID4gbXVj
aCBzZW5zZSB0byBhdHRhY2ggY2dyb3VwIHRyYWNraW5nIHRvIHRoZSBkcm1fbWlub3IuCj4gCj4g
VW0uLi4gSSB0aGluayBJIGdldCB3aGF0IHlvdSBhcmUgc2F5aW5nLCBidXQgaXNuJ3QgdGhpcyBh
IG1hdHRlciBvZgo+IHRoZSBjZ3JvdXAgY29udHJvbGxlciBkb2luZyBhIGRybV9kZXZfZ2V0IHdo
ZW4gdXNpbmcgdGhlIGRybV9taW5vcj8KPiBPciB0aGF0IHdvbid0IHdvcmsgYmVjYXVzZSBpdCdz
IHBvc3NpYmxlIHRvIGhhdmUgYSB2YWxpZCBkcm1fbWlub3IgYnV0Cj4gaW52YWxpZCBkcm1fZGV2
aWNlIGluIGl0PyBJIHVuZGVyc3RhbmQgaXQncyBhbiBleHRyYSBsZXZlbCBvZgo+IGluZGlyZWN0
aW9uIGJ1dCBzaW5jZSB0aGUgY29udmVudGlvbiBmb3IgYWRkcmVzc2luZyBkZXZpY2UgaW4gY2dy
b3VwCj4gaXMgdXNpbmcgJG1ham9yOiRtaW5vciBJIGRvbid0IHNlZSBhIHdheSB0byBlc2NhcGUg
dGhpcy4gIChUZWp1bgo+IGFjdHVhbGx5IGFscmVhZHkgbWFkZSBhIGNvbW1lbnQgb24gbXkgZWFy
bGllciBSRkMgd2hlcmUgSSBkaWRuJ3QKPiBmb2xsb3cgdGhlIG1ham9yOm1pbm9yIGNvbnZlbnRp
b24gc3RyaWN0bHkuKQoKZHJtX2RldmljZSBpcyB0aGUgb2JqZWN0IHRoYXQgY29udHJvbHMgbGlm
ZXRpbWUgYW5kIGV2ZXJ5dGhpbmcsIHRoYXQncyB3aHkKeW91IG5lZWQgdG8gZG8gYSBkcm1fZGV2
X2dldCBhbmQgYWxsIHRoYXQgaW4gc29tZSBwbGFjZXMuIEdvaW5nIHRocm91Z2gKdGhlIG1pbm9y
IHJlYWxseSBmZWVscyBsaWtlIGEgZGlzdHJhY3Rpb24uCgpBbmQgeWVzIHdlIGhhdmUgYSBiaXQg
YSBtZXNzIGJldHdlZW4gY2dyb3VwcyBpbnNpc3Rpbmcgb24gdXNpbmcgdGhlIG1pbm9yLAphbmQg
ZHJtX2RldmljZSBoYXZpbmcgbW9yZSB0aGFuIDEgbWlub3IgZm9yIHRoZSBzYW1lIHVuZGVybHlp
bmcgcGh5c2ljYWwKcmVzb3VyY2UuIEp1c3QgYmVjYXVzZSB0aGUgdWFwaSBpcyBhIGJpdCBhIG1l
c3MgaW4gdGhhdCByZWdhcmQgZG9lc24ndAptZWFuIHdlIHNob3VsZCBwdWxsIHRoYXQgbWVzcyBp
bnRvIHRoZSBrZXJuZWwgaW1wbGVtZW50YXRpb24gaW1vLgotRGFuaWVsCgo+IAo+IEtlbm55Cj4g
Cj4gPiA+ID4gSnVzdCBkb2luZyBhIGRybV9jZ19yZWdpc3Rlci91bnJlZ2lzdGVyIHBhaXIgdGhh
dCdzIGNhbGxlZCBmcm9tCj4gPiA+ID4gZHJtX2Rldl9yZWdpc3Rlci91bnJlZ2lzdGVyLCBhbmQg
dGhlbiBpZiB5b3Ugd2FudCwgbG9va2luZyB1cCB0aGUKPiA+ID4gPiByaWdodCBtaW5vciAoSSB0
aGluayBhbHdheXMgcGlja2luZyB0aGUgcmVuZGVyIG5vZGUgbWFrZXMgc2Vuc2UgZm9yCj4gPiA+
ID4gdGhpcywgYW5kIHNraXBwaW5nIGlmIHRoZXJlJ3Mgbm8gcmVuZGVyIG5vZGUpIHdvdWxkIG1h
a2UgbW9zdCBzZW5zZS4KPiA+ID4gPiBBdCBsZWFzdCBmb3IgdGhlIGJhc2ljIGNncm91cCBjb250
cm9sbGVycyB3aGljaCBhcmUgZ2VuZXJpYyBhY3Jvc3MKPiA+ID4gPiBkcml2ZXJzLgo+ID4gPgo+
ID4gPiBXaHkgZG8gd2Ugd2FudCB0byBza2lwIGRybSBkZXZpY2VzIHRoYXQgZG9lcyBub3QgaGF2
ZSBhIHJlbmRlciBub2RlCj4gPiA+IGFuZCBub3QganVzdCB1c2UgdGhlIHByaW1hcnkgaW5zdGVh
ZD8KPiA+Cj4gPiBJIGd1ZXNzIHdlIGNvdWxkIGFsc28gdGFrZSB0aGUgcHJpbWFyeSBub2RlLCBi
dXQgZHJpdmVycyB3aXRoIG9ubHkKPiA+IHByaW1hcnkgbm9kZSBhcmUgZ2VuZXJhbHkgZGlzcGxh
eS1vbmx5IGRybSBkcml2ZXJzLiBOb3Qgc3VyZSB3ZSB3YW50Cj4gPiBjZ3JvdXBzIG9uIHRob3Nl
IChidXQgSSBndWVzcyBjYW4ndCBodXJ0LCBhbmQgbW9yZSBjb25zaXN0ZW50KS4gQnV0Cj4gPiB0
aGVuIHdlJ2QgYWx3YXlzIG5lZWQgdG8gcGljayB0aGUgcHJpbWFyeSBub2RlIGZvciBjZ3JvdXAK
PiA+IGlkZW50aWZpY2F0aW9uIHB1cnBvc2VzLgo+ID4gLURhbmllbAo+ID4KPiA+ID4KPiA+ID4g
S2VubnkKPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gPiAtRGFuaWVsCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
