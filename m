Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCAD17AE89
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Mar 2020 19:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327A6EBF8;
	Thu,  5 Mar 2020 18:53:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827856E397
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Mar 2020 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583434376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTj2SstITt2uopEUfLgzf7yHTJH+TcssWR2vYV/JrmM=;
 b=BJaj7X37nPOMjF3IsibbEbvbL6wjhYFdtG0JWMq6immWQB+qu4f2NccIcHkLjBL3iWI/zW
 MYAxolbBEsIDL7BY6bw2w1pv0S9aoiWJvF89AVmQqZgH4nkLhVzK7poeVSo0spAcZt48LI
 8ko58mSYKmUv/Iah3oFWuVzTHmdI+n0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-lWpQv9nHOg65jUW6_AuSPg-1; Thu, 05 Mar 2020 13:52:52 -0500
X-MC-Unique: lWpQv9nHOg65jUW6_AuSPg-1
Received: by mail-qk1-f199.google.com with SMTP id h6so4469180qkj.14
 for <amd-gfx@lists.freedesktop.org>; Thu, 05 Mar 2020 10:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RH9rmtOcZDthbsyDXEkU3rwq+PLEuDnB80nQoDiyIKk=;
 b=ZAdWIH0pi1yG+jc7RD7oXyELsHr6YuS6/kJ3956yvuZgkB9q4VqUn31kCbBUeg1M7W
 xTQnR0GeragCDHetbdeWtE5kPLCPNWVA5N8HmE95oFtc/valBobeto3sScqccTSKsMHW
 sSbpQwEg5xrWwocoYDi3C6V3jFbC2yXSBJfHhKKkxX7P2hBCLUVUzmrIfb7HMhpqumiL
 wTx5BxLE0kFZ+ZEQqlvk2wZGmaOXXNw7WVtHpuA896QL1n3r4siSgHXp7tbkeO8/2n4e
 bKAZCykA/65RAFjqbEYVU9MJOdGnBZuL8GQwOxGUKZQAAU9BhgZ2yX9Z9ECTSRUNFjpP
 CrAA==
X-Gm-Message-State: ANhLgQ0Brm0Je0yU8ybXYmE9mnR/g1iRrtqhKgQEkm9Bvs1nftoyZtzZ
 XQrx9zwnAU5x6ZQX1TZRXLGJKJ5Ygeit5JMJqorEhTpI216FzOk1C0P4EQ8R4vyFA0RWq/VeqkY
 /fdAkYPdGNRAm1PzH+g0XBzbEVA==
X-Received: by 2002:ac8:6f79:: with SMTP id u25mr109668qtv.180.1583434372234; 
 Thu, 05 Mar 2020 10:52:52 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvJXz2ZSsIo3bYzKu/1CSKGSWGjbmWcq9syd6DB4n7dJrhaY4trWfVTG96f/HjSNPw356xESQ==
X-Received: by 2002:ac8:6f79:: with SMTP id u25mr109650qtv.180.1583434371935; 
 Thu, 05 Mar 2020 10:52:51 -0800 (PST)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id b5sm6777932qkk.16.2020.03.05.10.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 10:52:51 -0800 (PST)
Message-ID: <efe5fc9895eaab47200e813280873894c0f98c8b.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/dp_mst: Don't show connectors as connected
 before probing available PBN
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 05 Mar 2020 13:52:50 -0500
In-Reply-To: <20200305182942.GP13686@intel.com>
References: <20200304223614.312023-1-lyude@redhat.com>
 <20200304223614.312023-3-lyude@redhat.com>
 <20200305131119.GJ13686@intel.com>
 <73f52c392431cd21a80a118dd2fd1986e2c535df.camel@redhat.com>
 <20200305182942.GP13686@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDIwOjI5ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMDE6MTM6MzZQTSAtMDUwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IE9uIFRodSwgMjAyMC0wMy0wNSBhdCAxNToxMSArMDIwMCwgVmlsbGUgU3lyasOk
bMOkIHdyb3RlOgo+ID4gPiBPbiBXZWQsIE1hciAwNCwgMjAyMCBhdCAwNTozNjoxMlBNIC0wNTAw
LCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gPiA+IEl0J3MgbmV4dCB0byBpbXBvc3NpYmxlIGZvciB1
cyB0byBkbyBjb25uZWN0b3IgcHJvYmluZyBvbiB0b3BvbG9naWVzCj4gPiA+ID4gd2l0aG91dCBv
Y2Nhc2lvbmFsbHkgcmFjaW5nIHdpdGggdXNlcnNwYWNlLCBzaW5jZSBjcmVhdGluZyBhIGNvbm5l
Y3Rvcgo+ID4gPiA+IGl0c2VsZiBjYXVzZXMgYSBob3RwbHVnIGV2ZW50IHdoaWNoIHdlIGhhdmUg
dG8gc2VuZCBiZWZvcmUgcHJvYmluZyB0aGUKPiA+ID4gPiBhdmFpbGFibGUgUEJOIG9mIGEgY29u
bmVjdG9yLiBFdmVuIGlmIHdlIGRpZG4ndCBoYXZlIHRoaXMgaG90cGx1Zwo+ID4gPiA+IGV2ZW50
Cj4gPiA+ID4gc2VudCwgdGhlcmUncyBzdGlsbCBhbHdheXMgYSBjaGFuY2UgdGhhdCB1c2Vyc3Bh
Y2Ugc3RhcnRlZCBwcm9iaW5nCj4gPiA+ID4gY29ubmVjdG9ycyBiZWZvcmUgd2UgZmluaXNoZWQg
cHJvYmluZyB0aGUgdG9wb2xvZ3kuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBjYW4gYmUgYSBwcm9i
bGVtIHdoZW4gdmFsaWRhdGluZyBhIG5ldyBNU1Qgc3RhdGUgc2luY2UgdGhlCj4gPiA+ID4gY29u
bmVjdG9yIHdpbGwgYmUgc2hvd24gYXMgY29ubmVjdGVkIGJyaWVmbHksIGJ1dCB3aXRob3V0IGFu
eQo+ID4gPiA+IGF2YWlsYWJsZQo+ID4gPiA+IFBCTiAtIGNhdXNpbmcgYW55IGF0b21pYyBzdGF0
ZSB3aGljaCB3b3VsZCBlbmFibGUgc2FpZCBjb25uZWN0b3IgdG8KPiA+ID4gPiBmYWlsCj4gPiA+
ID4gd2l0aCAtRU5PU1BDLiBTbywgbGV0J3Mgc2ltcGx5IHdvcmthcm91bmQgdGhpcyBieSB0ZWxs
aW5nIHVzZXJzcGFjZQo+ID4gPiA+IG5ldwo+ID4gPiA+IE1TVCBjb25uZWN0b3JzIGFyZSBkaXNj
b25uZWN0ZWQgdW50aWwgd2UndmUgZmluaXNoZWQgcHJvYmluZyB0aGVpcgo+ID4gPiA+IFBCTi4K
PiA+ID4gPiBTaW5jZSB3ZSBhbHdheXMgc2VuZCBhIGhvdHBsdWcgZXZlbnQgYXQgdGhlIGVuZCBv
ZiB0aGUgbGluayBhZGRyZXNzCj4gPiA+ID4gcHJvYmluZyBwcm9jZXNzLCB1c2Vyc3BhY2Ugd2ls
bCBzdGlsbCBrbm93IHRvIHJlcHJvYmUgdGhlIGNvbm5lY3Rvcgo+ID4gPiA+IHdoZW4KPiA+ID4g
PiB3ZSdyZSByZWFkeS4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVs
IDxseXVkZUByZWRoYXQuY29tPgo+ID4gPiA+IEZpeGVzOiBjZDgyZDgyY2JjMDQgKCJkcm0vZHBf
bXN0OiBBZGQgYnJhbmNoIGJhbmR3aWR0aCB2YWxpZGF0aW9uIHRvCj4gPiA+ID4gTVNUCj4gPiA+
ID4gYXRvbWljIGNoZWNrIikKPiA+ID4gPiBDYzogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNr
aUBhbWQuY29tPgo+ID4gPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Cj4gPiA+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAZ29vZ2xlLmNvbT4KPiA+ID4g
PiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPiA+ID4gPiAtLS0KPiA+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDEzICsrKysrKysr
KysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiA+ID4gPiAK
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
Ywo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiA+
IGluZGV4IDIwN2VlZjA4ZDEyYy4uN2IwZmYwY2ZmOTU0IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiA+ID4gQEAgLTQwMzMsNiArNDAzMywx
OSBAQCBkcm1fZHBfbXN0X2RldGVjdF9wb3J0KHN0cnVjdCBkcm1fY29ubmVjdG9yCj4gPiA+ID4g
KmNvbm5lY3RvciwKPiA+ID4gPiAgCQkJcmV0ID0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7
Cj4gPiA+ID4gIAkJYnJlYWs7Cj4gPiA+ID4gIAl9Cj4gPiA+ID4gKwo+ID4gPiA+ICsJLyogV2Ug
ZG9uJ3Qgd2FudCB0byB0ZWxsIHVzZXJzcGFjZSB0aGUgcG9ydCBpcyBhY3R1YWxseQo+ID4gPiA+
IHBsdWdnZWQgaW50bwo+ID4gPiA+ICsJICogYW55dGhpbmcgdW50aWwgd2UndmUgZmluaXNoZWQg
cHJvYmluZyBpdCdzIGF2YWlsYWJsZV9wYm4sCj4gPiA+ID4gb3RoZXJ3aXNlCj4gPiA+IAo+ID4g
PiAiaXRzIgo+ID4gPiAKPiA+ID4gV2h5IGlzIHRoZSBjb25uZWN0b3IgZXZlbiByZWdpc3RlcmVk
IGJlZm9yZSB3ZSd2ZSBmaW5pc2hlZCB0aGUgcHJvYmU/Cj4gPiA+IAo+ID4gT29wcywgSSdtIG5v
dCBzdXJlIGhvdyBJIGRpZCB0aGlzIGJ5IGFjY2lkZW50IGJ1dCB0aGUgZXhwbGFuYXRpb24gSSBn
YXZlCj4gPiBpbgo+ID4gdGhlIGNvbW1pdCBtZXNzYWdlIHdhcyB1aCwgY29tcGxldGVseSB3cm9u
Zy4gSSBtdXN0IGhhdmUgZm9yZ290dGVuIHRoYXQgSQo+ID4gbWFkZQo+ID4gc3VyZSB3ZSBkaWRu
J3QgZXhwb3NlIGNvbm5lY3RvcnMgYmVmb3JlIHByb2JpbmcgdGhlaXIgUEJOIGJhY2sgd2hlbiBJ
Cj4gPiBzdGFydGVkCj4gPiBteSBNU1QgY2xlYW51cC4uLi4KPiA+IAo+ID4gU286IGRlc3BpdGUg
d2hhdCBJIHNhaWQgYmVmb3JlIGl0J3Mgbm90IGFjdHVhbGx5IHdoZW4gbmV3IGNvbm5lY3RvcnMg
YXJlCj4gPiBjcmVhdGVkLCBpdCdzIHdoZW4gZG93bnN0cmVhbSBob3RwbHVncyBoYXBwZW4gd2hp
Y2ggbWVhbnMgdGhhdCB0aGUKPiA+IGNvbmVuY3RvcidzCj4gPiBhbHdheXMgZ29pbmcgdG8gYmUg
dGhlcmUgYmVmb3JlIHdlIHByb2JlIHRoZSBhdmFpbGFibGVfcGJuLgo+IAo+IE5vdCBzdXJlIEkg
dW5kZXJzdGFuZC4gWW91J3JlIHNheWluZyB0aGlzIGlzIGdvaW5nIHRvIGNoYW5nZSBmb3IgYWxy
ZWFkeQo+IGV4aXN0aW5nIGNvbm5lY3RvcnMgd2hlbiBzb21ldGhpbmcgZWxzZSBnZXRzIHBsdWdn
ZWQgaW4sIGFuZCBlaXRoZXIgd2UKPiB6ZXJvIGl0IG91dCBkdXJpbmcgdGhlIHByb2JlIG9yIGl0
IGFsd2F5cyB3YXMgemVybyB0byBiZWdpbiB3aXRoIGZvcgo+IHdoYXRldmVyIHJlYXNvbj8KClNv
OiB5b3UganVzdCBtYWRlIG1lIHJlYWxpemUgdGhhdCBJJ20gbm90IGFjdHVhbGx5IHN1cmUgd2hl
dGhlciB0aGVyZSdzIGFueQpwb2ludCB0byB1cyBjbGVhcmluZyBwb3J0LT5hdmFpbGFibGVfcGJu
IGhlcmUgc2luY2UgdGhlIGF2YWlsYWJsZV9wYm4gKGF0CmxlYXN0IHRoZSB2YWx1ZSB0aGF0IHdl
IGNhY2hlIG9uIGluaXRpYWwgbGluayBhZGRyZXNzIHByb2JpbmcgZm9yIGJhbmR3aWR0aApjb25z
dHJhaW50IGNoZWNraW5nKSBzaG91bGRuJ3QgYWN0dWFsbHkgY2hhbmdlIG9uIGEgcG9ydCBqdXN0
IGJlY2F1c2Ugb2YgYQpob3RwbHVnLiBJIGJldCB0aGlzIGlzIHByb2JhYmx5IGNhdXNpbmcgbW9y
ZSBwcm9ibGVtcyBvbiBpdCdzIG93biBhcyB3ZWxsLApzaW5jZSByZXByb2JpbmcgdGhlIGF2YWls
YWJsZV9wYm4gbWlnaHQgYWN0dWFsbHkgZ2l2ZSB1cyBhIHZhbHVlIHRoYXQgcmVmbGVjdHMKYWxs
b2NhdGlvbnMgb24gb3RoZXIgcG9ydHMgdGhhdCBhcmUgYWxyZWFkeSBpbiBwbGFjZS4KClNvOiBJ
IHRoaW5rIHdoYXQgSSdtIGdvaW5nIHRvIGRvIGluc3RlYWQgaXMgbWFrZSBpdCBzbyB0aGF0IHdl
IG5ldmVyIGNsZWFyCnBvcnQtPmF2YWlsYWJsZV9wYm47IG1haW5seSB0byBtYWtlIHRoaW5ncyBs
ZXNzIGNvbXBsaWNhdGVkIGR1cmluZwpzdXNwZW5kL3Jlc3VtZSwgc2luY2Ugd2Ugd2FudCB0byBt
YWtlIHN1cmUgdGhlcmUncyBhbHdheXMgc29tZSBzb3J0IG9mIFBCTgp2YWx1ZSBwb3B1bGF0ZWQg
ZXZlbiBkdXJpbmcgdGhlIG1pZGRsZSBvZiByZXByb2JpbmcgdGhlIGxpbmsgYWRkcmVzcyBvbgpy
ZXN1bWUuIFRoYXQgd2F5IHdlIGRvbid0IGhhdmUgdG8gcHJldGVuZCB0aGF0IGl0J3MgZXZlciBk
aXNjb25uZWN0ZWQgZWl0aGVyLgpXaWxsIHNlbmQgYSByZXNwaW4gaW4gYSBiaXQuCgo+IAo+ID4g
SSBkaWQganVzdCBub3RpY2UKPiA+IHRob3VnaCB0aGF0IHdlIHNlbmQgYSBob3RwbHVnIG9uIGNv
bm5lY3Rpb24gc3RhdHVzIG5vdGlmaWNhdGlvbnMgZXZlbgo+ID4gYmVmb3JlCj4gPiB3ZSd2ZSBm
aW5pc2hlZCB0aGUgUEJOIHByb2JlLCBzbyBJIG1pZ2h0IGJlIGFibGUgdG8gaW1wcm92ZSBvbiB0
aGF0IGFzCj4gPiB3ZWxsLgo+ID4gV2Ugc3RpbGwgZGVmaW5pdGVseSB3YW50IHRvIHJlcG9ydCB0
aGUgY29ubmVjdG9yIGFzIGRpc2Nvbm5lY3RlZCBiZWZvcmUgd2UKPiA+IGhhdmUgdGhlIGF2YWls
YWJsZSBQQk4gdGhvdWdoLCBpbiBjYXNlIGFub3RoZXIgcHJvYmUgd2FzIGFscmVhZHkgZ29pbmcK
PiA+IGJlZm9yZQo+ID4gd2UgZ290IHRoZSBjb25uZWN0aW9uIHN0YXR1cyBub3RpZmljYXRpb24u
Cj4gPiAKPiA+IEknbGwgbWFrZSBzdXJlIHRvIGZpeHVwIHRoZSBleHBsYW5hdGlvbiBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2Ugb24gdGhlIG5leHQKPiA+IHJlc3Bpbgo+ID4gCj4gPiA+ID4gKwkgKiB1
c2Vyc3BhY2Ugd2lsbCBzZWUgcmFjeSBhdG9taWMgY2hlY2sgZmFpbHVyZXMKPiA+ID4gPiArCSAq
Cj4gPiA+ID4gKwkgKiBTaW5jZSB3ZSBhbHdheXMgc2VuZCBhIGhvdHBsdWcgYXQgdGhlIGVuZCBv
ZiBwcm9iaW5nCj4gPiA+ID4gdG9wb2xvZ3kKPiA+ID4gPiArCSAqIHN0YXRlLCB3ZSBjYW4ganVz
dCBsZXQgdXNlcnNwYWNlIHJlcHJvYmUgdGhpcyBjb25uZWN0b3IKPiA+ID4gPiBsYXRlci4KPiA+
ID4gPiArCSAqLwo+ID4gPiA+ICsJaWYgKHJldCA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3Rl
ZCAmJiAhcG9ydC0+YXZhaWxhYmxlX3BibikgCj4gPiA+ID4gewo+ID4gPiA+ICsJCURSTV9ERUJV
R19LTVMoIltDT05ORUNUT1I6JWQ6JXNdIG5vdCByZWFkeSB5ZXQgKFBCTgo+ID4gPiA+IG5vdAo+
ID4gPiA+IHByb2JlZClcbiIsCj4gPiA+ID4gKwkJCSAgICAgIGNvbm5lY3Rvci0+YmFzZS5pZCwg
Y29ubmVjdG9yLT5uYW1lKTsKPiA+ID4gPiArCQlyZXQgPSBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nv
bm5lY3RlZDsKPiA+ID4gPiArCX0KPiA+ID4gPiAgb3V0Ogo+ID4gPiA+ICAJZHJtX2RwX21zdF90
b3BvbG9neV9wdXRfcG9ydChwb3J0KTsKPiA+ID4gPiAgCXJldHVybiByZXQ7Cj4gPiA+ID4gLS0g
Cj4gPiA+ID4gMi4yNC4xCj4gPiA+ID4gCj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
PiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gPiAtLSAKPiA+
IENoZWVycywKPiA+IAlMeXVkZSBQYXVsIChzaGUvaGVyKQo+ID4gCUFzc29jaWF0ZSBTb2Z0d2Fy
ZSBFbmdpbmVlciBhdCBSZWQgSGF0Ci0tIApDaGVlcnMsCglMeXVkZSBQYXVsIChzaGUvaGVyKQoJ
QXNzb2NpYXRlIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
