Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B2C4895
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 09:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF807891EB;
	Wed,  2 Oct 2019 07:35:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0-9.i-mecca.net (mx0-11.i-mecca.net [76.74.184.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD934891EB
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 07:35:02 +0000 (UTC)
Received: from mx0.ehosting.ca (localhost [127.0.0.1])
 by mx0.i-mecca.net (Postfix) with ESMTP id C7A72161553;
 Wed,  2 Oct 2019 00:35:00 -0700 (PDT)
Received: from ns14.i-mecca.net (unknown [192.168.1.14])
 by mx0.i-mecca.net (Postfix) with ESMTP id 3E0A116154F;
 Wed,  2 Oct 2019 00:34:58 -0700 (PDT)
X-MES: 1.0
Received: from [192.168.1.76] (d75-157-136-159.bchsia.telus.net
 [75.157.136.159])
 by ns14.i-mecca.net (Postfix) with ESMTPSA id D5D6D14045A;
 Wed,  2 Oct 2019 00:34:57 -0700 (PDT)
Subject: Re: [Follow-up] Status of AMD Sensor Fusion HUB for Linux
To: Alex Deucher <alexdeucher@gmail.com>
References: <63bd81a9-7166-73df-6605-83489fa7daf1@fedoraproject.org>
 <CADnq5_NdHsap-mBwyhQNRHu_T=Vo_wPAEGjdHD1WxOdLW28-rw@mail.gmail.com>
From: Luya Tshimbalanga <luya@fedoraproject.org>
Organization: Fedora Project
Message-ID: <6a36628f-ce09-51a0-66c3-b7f21f0dd67e@fedoraproject.org>
Date: Wed, 2 Oct 2019 00:34:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_NdHsap-mBwyhQNRHu_T=Vo_wPAEGjdHD1WxOdLW28-rw@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDktMjYgMTA6MDMgYS5tLiwgQWxleCBEZXVjaGVyIHdyb3RlOgo+IE9uIFRodSwg
U2VwIDI2LCAyMDE5IGF0IDM6NTkgQU0gTHV5YSBUc2hpbWJhbGFuZ2EKPiA8bHV5YUBmZWRvcmFw
cm9qZWN0Lm9yZz4gd3JvdGU6Cj4+IEhlbGxvLAo+Pgo+PiBXaGF0IGlzIHRoZSBjdXJyZW50IHN0
YXR1cyBvZiB0aGUgZHJpdmVyIG9yIG1vZHVsZSBmb3IgQU1EIFNlbnNvciBGdXNpb24KPj4gSFVC
IGZvciBtb2JpbGUgUmF2ZW4gUmlkZ2UgZmFtaWx5PyBUbyB0aGlzIGRheSwgbWFqb3JpdHkgb2Yg
bW9iaWxlCj4+IHBvd2VyZWQgZGV2aWNlIGVxdWlwcGVkIHdpdGggdGhhdCBBUFUgZmFtaWx5IGxh
Y2tzIGd5cm9zY29waWMgZnVuY3Rpb24KPj4gZm9yIHRoZSBzY3JlZW4uCj4+Cj4gVGhlIEZDSCB0
ZWFtIGhhcyBhbiBpbml0aWFsIGltcGxlbWVudGF0aW9uIGRvbmUuICBJSVJDLCB0aGV5IGFyZSBq
dXN0Cj4gY2xlYW5pbmcgdGhpbmdzIHVwIGFuZCByZXN0cnVjdHVyaW5nIGJhc2VkIG9uIGNvbW11
bml0eQo+IHJlY29tbWVuZGF0aW9ucy4gIEkgdGhpbmsgdGhlIHBhdGNoZXMgc2hvdWxkIGJlIGF2
YWlsYWJsZSBzb29uIGlmIHRoZXkKPiBhcmUgbm90IGFscmVhZHkuCj4KPiBBbGV4Cj4KV2hpY2gg
cmVwb3NpdG9yeSBjb3VsZCB3ZSB2aWV3IHRoZSBwYXRjaCBvbmNlIGl0IGxhbmRzPwoKLS0gCkx1
eWEgVHNoaW1iYWxhbmdhCkZlZG9yYSBEZXNpZ24gVGVhbQpGZWRvcmEgRGVzaWduIFN1aXRlIG1h
aW50YWluZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
