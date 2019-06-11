Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0643C774
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 11:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BFD89187;
	Tue, 11 Jun 2019 09:42:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9EA89083
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 09:42:28 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p26so15058493edr.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 02:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PX6RKB+aNiXuwc2tkgg7wZYFO8PUdcQOHP+CCQKfWic=;
 b=ILmp7kD+6uNn4aiNm7G65vJjfabeNoQZ2TOukZvW8qXPvwCUyRcnBh1iQWb4Y1aMNE
 VU1f0NHQkNpdHPRD5/ivPkgSvNBtBV0FJ3eJtKVoIsEtGt14oYbx1Pym7eEGJFCf4Zyj
 tlrzFWXHSI882ddgCbwYQJibktQKyl7MVAjYRi9YOETsaqANZucl1PD8XZP7kRojXxAW
 c2bJ5eoMsG8hin5M3Eeg7rYEM0kFSMi0s72IRISSFgrVHOU0Ia8l3CD8cbCKE/0j8U4y
 xyK2wd5EWoEy0BQNedY7RvtgGhx01vJUna0qaIcKq/B4fqa3L0wULVETF5QLwBs04fxB
 MYNg==
X-Gm-Message-State: APjAAAWfSWF2DgVzG9Lzys0w9dEA5VP83qAPiLovFSODnF4KC1KXImj+
 VZLflNszJkfQZbb3AgNt+Eit3w==
X-Google-Smtp-Source: APXvYqxtcMiIxgZywWHT7FOUGyVkgMxOmyCXmrHMBsD17xfz1XHFMgjhlN0S7lUfPzb9XDWgbnGMrg==
X-Received: by 2002:a17:906:451:: with SMTP id
 e17mr9219107eja.161.1560246147372; 
 Tue, 11 Jun 2019 02:42:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm2836182edd.49.2019.06.11.02.42.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 02:42:26 -0700 (PDT)
Date: Tue, 11 Jun 2019 11:42:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/10] drm: fix build errors with drm_print.h
Message-ID: <20190611094224.GA21222@phenom.ffwll.local>
References: <20190609220757.10862-1-sam@ravnborg.org>
 <20190609220757.10862-2-sam@ravnborg.org>
 <20190611083911.GT21222@phenom.ffwll.local>
 <20190611091107.GA29656@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611091107.GA29656@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PX6RKB+aNiXuwc2tkgg7wZYFO8PUdcQOHP+CCQKfWic=;
 b=a3WcHnUh4hY+3q33vgI4EdO09m4xZwEnxGcULxCDXFLD6t+XzYeMg5IKzCWfInyhsu
 huSNcToCRbshAcZUU/u9gWTE5+fCD96jwR4wwq58IjJFkMDUV0RbQWcmZEiD/Lgmy7Bd
 s+q06aqTTGjPJ0Erl4zhMEvu6/NL/XnYRYQow=
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTE6MTE6MDdBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIERhbmllbC4KPiAKPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMDozOToxMUFN
ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMTAsIDIwMTkgYXQg
MTI6MDc6NDhBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gPiBkcm1fcHJpbnQuaCBy
ZXF1aXJlcyA8ZHJtL2RybS5oPiB0byBmaXggYnVpbGQgd2hlbiBtYWNyb3MgYXJlIHVzZWQuCj4g
PiA+IFB1bGwgaW4gdGhlIGhlYWRlciBmaWxlIGluIGRybV9wcmludC5oIHNvIHVzZXJzIGRvIG5v
dCBoYXZlIHRvIGRvIGl0Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+ID4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KPiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gLS0tCj4gPiA+ICBpbmNsdWRlL2Ry
bS9kcm1fcHJpbnQuaCB8IDIgKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9wcmludC5oCj4gPiA+IGluZGV4IDNhNDI0NzMxOWU2My4uYTVkNmYyZjNl
NDMwIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ID4gPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ID4gPiBAQCAtMzIsNiArMzIsOCBAQAo+ID4gPiAg
I2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMu
aD4KPiA+ID4gIAo+ID4gPiArI2luY2x1ZGUgPGRybS9kcm0uaD4KPiA+IAo+ID4gV2hhdCBnb2Vz
IGJvb20gd2l0aG91dCB0aGlzPyBPbmx5IGRybS9kcm0uaCB0aGF0IEkgY291bGQgZmluZCB3YXMg
dGhlIG9uZQo+ID4gaW4gdWFwaS9kcm0vZHJtLmgsIGFuZCB0aGF0IG9uZSBsb29rcyB2ZXJ5IGZp
c2h5IHRvIGluY2x1ZGUgZnJvbSBhbgo+ID4gaW50ZXJuYWwgaGVscGVyIGhlYWRlciBsaWtlIHBy
aW50LmguCj4gCj4gZHJtX3ByaW50LmggdXNlcyBEUk1fTkFNRSAtIHdoaWNoIGlzIGRlZmluZWQg
b25seSBpbiB1YXBpL2RybS9kcm0uaC4KPiBUaGUgZXJyb3IgaXMgc2VlbiB3aGVuIHlvdSBpbmNs
dWRlIGRybV9wcmludC5oIGFuZCBub3QgbXVjaCBvdGhlciBkcm0KPiBoZWFkZXIgZmlsZXMuCj4g
VGlkYXkgd2UgcmVseSBvbiBvdGhlciBkcm0gaGVhZGVyIGZpbGVzIHRvIHB1bGwgaW4gZHJtLmgu
Cj4gCj4gTm90aWNlIC0gdGhlIGVycm9yIG9ubHkgbWFuaWZlc3QgaXRzZWxmIHdoZW4gdGhlIG1h
Y3JvcyBhcmUgdXNlZC4KPiBJbmNsdWRpbmcgdGhlIGRybV9wcmludC5oIHdpbGwgbm90IGRvIGl0
LgoKVWgsIEkgdGhpbmsgbGV0J3MganVzdCBpbmxpbmUgRFJNX05BTUUsIHRoYXQgYWxzbyBjbGVh
bnMgdXAgdGhlIGNvZGUuIEFuZApkcm9wIHRoZSB1YXBpIGluY2x1ZGUgZnJvbSBkcm0gaW50ZXJu
YWwgaGVhZGVycywgdGhhdCBmZWVscyBiYWQuIEluCmdlbmVyYWwgSSB0aGluayB1YXBpIGhlYWRl
cnMgc2hvdWxkIG9ubHkgYmUgaW5jbHVkZWQgYnkgdGhlIC5jIGZpbGVzIHRoYXQKYWN0dWFsbHkg
aW1wbGVtZW50IGlvY3RscyBhbmQgc3R1ZmYgbGlrZSB0aGF0LgoKQ2FuIHlvdSBwbHMgZG8gdGhh
dCBwYXRjaCBmb3IgZHJtX3ByaW50Lmg/CgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
