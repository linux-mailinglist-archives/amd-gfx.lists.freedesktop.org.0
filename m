Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0623A11D08F
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Dec 2019 16:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703BC6E17E;
	Thu, 12 Dec 2019 15:09:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C8A6E17E
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Dec 2019 15:09:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so2747799wmc.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Dec 2019 07:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZwHO8CH+H/pmyJ+L73tuxmZ5Z3Bik/knFt+IpvTNMFg=;
 b=Ir3NZLeHVbOhQtAWiZteBvpIFFigr+O/sqZQDU/8k3HQlzqLXTKBDpItGDx52QyXTO
 23VwyY10etJf2j+l0f+j3QtJmcsm129+tFOEHyE6po+lQiQTwHHYz1qW9eJGARLwajfL
 9BVPQzUzT8XcDoZnD8Gzn7WrOix0kMujchHEC2zEI0GP+Ri2EQ43waJK1Er1GsL89vp7
 hP2QKKDsiauv4kkS1K48Xu33DDhS1KKsDLFIaVMfBRYgV1HzXQoeH0Eiu6wpQrLooP/w
 IIm/CeHqe2O6qqisrSdTrMFAza3x0wbk7YuqA7ExEAjFncMwkEcnTD4V+fSSkadkgRup
 ri2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ZwHO8CH+H/pmyJ+L73tuxmZ5Z3Bik/knFt+IpvTNMFg=;
 b=D5Q8H4eLAqzW1I5IR5oRcQRFkoB7xqVr8xsgGOr0/JVOSdQ1PfkOHrJIrJj5+E7IA9
 WPshud/lv02yASQ7mZLdlAJPglD7zxn8NDubOSK9U91vB7Tfvijxxl96HXwYNSd8cVM1
 EOnaE5k8F49OZwJ1TuOz5p/g5IHybJI2SCcgZKm0PR3IpWyZ8aO1e1FKMP1gmFwZItRF
 +l9yNzNXv8O8kVrQ3MjB5IbQCJU9nz3MJHvpw7gSzNxXp3mzr04ccQi6fv3Xcw5sSFCO
 JqXq1zLN+YtJaDkXc0j8ZWs/Rp7KOS5OvRLbXThtUOwLz7uJ3Vz7kCuPyBWc9antBEjY
 U5Vg==
X-Gm-Message-State: APjAAAUj37GF2MlZuW0N08udb+hAGrSG33p4o29sFIizwOeWIdvDE2IQ
 GGr7rIaZWksP3I4pbukXOrQ=
X-Google-Smtp-Source: APXvYqwbpHv0N+8TZtPxBA6y4EvuqrYV07O5oghNTduLfwX+Zqjq3ot4hBJtp8UugH6wNNnjHsztFw==
X-Received: by 2002:a1c:1d8c:: with SMTP id d134mr7511472wmd.16.1576163368322; 
 Thu, 12 Dec 2019 07:09:28 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v4sm9871151wml.2.2019.12.12.07.09.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 07:09:27 -0800 (PST)
Subject: Re: [PATCH 2/5] drm: Add Reusable task barrier.
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <1576094829-2245-1-git-send-email-andrey.grodzovsky@amd.com>
 <1576094829-2245-2-git-send-email-andrey.grodzovsky@amd.com>
 <CADnq5_OCzqh_t5YHithp2Kh0rxHsk4XxnfHm-Cm2_T7ZGSA4Ow@mail.gmail.com>
 <2b12b91a-e40f-25f4-bc7c-71566ffdabd4@gmail.com>
 <fa72ffe9-39fb-4bf2-f8e7-8b4f53cfa7ad@gmail.com>
 <MWHPR12MB1453492D18A1C692AFFE701AEA550@MWHPR12MB1453.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <dcfc91e5-fc0b-8965-e955-546a12e64ea0@gmail.com>
Date: Thu, 12 Dec 2019 16:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR12MB1453492D18A1C692AFFE701AEA550@MWHPR12MB1453.namprd12.prod.outlook.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Ma, Le" <Le.Ma@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTIuMTIuMTkgdW0gMTU6NTAgc2NocmllYiBHcm9kem92c2t5LCBBbmRyZXk6Cj4gW0FNRCBP
ZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmln
IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KPiBTZW50OiAxMiBEZWNlbWJlciAy
MDE5IDAzOjMxCj4gVG86IEFsZXggRGV1Y2hlcjsgR3JvZHpvdnNreSwgQW5kcmV5Cj4gQ2M6IERl
dWNoZXIsIEFsZXhhbmRlcjsgTWEsIExlOyBRdWFuLCBFdmFuOyBhbWQtZ2Z4IGxpc3Q7IFpoYW5n
LCBIYXdraW5nCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzVdIGRybTogQWRkIFJldXNhYmxlIHRh
c2sgYmFycmllci4KPgo+IEFtIDEyLjEyLjE5IHVtIDA5OjI0IHNjaHJpZWIgQ2hyaXN0aWFuIEvD
tm5pZzoKPj4gQW0gMTEuMTIuMTkgdW0gMjE6MTkgc2NocmllYiBBbGV4IERldWNoZXI6Cj4+PiBP
biBXZWQsIERlYyAxMSwgMjAxOSBhdCAzOjA3IFBNIEFuZHJleSBHcm9kem92c2t5Cj4+PiA8YW5k
cmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cj4+Pj4gSXQgaXMgdXNlZCB0byBzeW5jaHJv
bml6ZSBOIHRocmVhZHMgYXQgYSByZW5kZXZvdXogcG9pbnQgYmVmb3JlCj4+Pj4gZXhlY3V0aW9u
Cj4+Pj4gb2YgY3JpdGljYWwgY29kZSB0aGF0IGhhcyB0byBiZSBzdGFydGVkIGJ5IGFsbCB0aGUg
dGhyZWFkcyBhdAo+Pj4+IGFwcHJveGltYXRseQo+Pj4+IHRoZSBzYW1lIHRpbWUuCj4+Pj4KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1k
LmNvbT4KPj4+IFlvdSBzaG91bGQgcmVzZW5kIHRvIGRyaS1kZXZlbCBzaW5jZSB0aGlzIHRhc2sg
YmFycmllciBpcyBiZWluZyBhZGRlZAo+Pj4gdG8gY29tbW9uIGNvZGUuCj4+IEFkZGl0aW9uYWwg
dG8gdGhhdCB0aGlzIHdob2xlIHRoaW5nIGhhcyB0aGUgcG90ZW50aWFsIHRvIHJhaXNlIGxvY2tk
ZXAKPj4gd2FybmluZ3MgYW5kIGlmIEknbSBub3QgY29tcGxldGVseSBtaXN0YWtlbiBkb2Vzbid0
IGV2ZW4gd29yayBjb3JyZWN0bHkuCj4gQ2FuIHlvdSBnaXZlIG1lIGEgcG90ZW50aWFsIGxvY2tk
ZXAgc2NlbmFyaW8gPwoKTG9ja2RlcCB1c3VhbGx5IGNvbXBsYWlucyBpZiBhIGxvY2sgaXMgcmVs
ZWFzZWQgZnJvbSBhbm90aGVyIHRocmVhZCB0aGFuIAp3aGVyZSBpdCB3YXMgbG9ja2VkIGZyb20u
CgpJbiB0aGUgY29kZSB5b3UgbGV0IGVhY2ggdGhyZWFkIGRvIGEgZG93bigpIGFuZCB0aGVuIHRo
ZSBsYXN0IG9uZSBkb2VzIAptdWx0aXBsZSB1cCgpIGNhbGxzLgoKQnV0IEkgdGhpbmsgdGhhdCBp
cyBvbmx5IGlsbGVnYWwgZm9yIG11dGV4ZXMsIGJ1dCBsZWdhbCBmb3Igc2VtYXBob3Jlcy4KCkNo
cmlzdGlhbi4KCj4KPiBBbmRyZXkKPgo+PiBTZWUgTGludXgga2VybmVsIHNlbWFwaG9yZXMgZG9u
J3QgYWxsb3cgbmVnYXRpdmUgdmFsdWVzICh0aGUgY291bnQKPj4gZmllbGQgaW4gc3RydWN0IHNl
bWFwaG9yZSBpcyB1bnNpZ25lZCkuCj4gT2ssIGZvcmdldCB3aGF0IEkndmUgd3JvdGUuIFRoYXQg
aW5kZWVkIHNlZW1zIHRvIGJlIHN1cHBvcnRlZCwgc29tZQo+IG90aGVyIGRyaXZlcnMgYXJlIGFs
cmVhZHkgdXNpbmcgc2VtYXBob3JlcyB0aGUgc2FtZSB3YXkuCj4KPiBSZWdhcmRzLAo+IENocmlz
dGlhbi4KPgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBBbGV4Cj4+Pgo+Pj4+IC0t
LQo+Pj4+ICAgIGluY2x1ZGUvZHJtL3Rhc2tfYmFycmllci5oIHwgMTA2Cj4+Pj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDEwNiBpbnNlcnRpb25zKCspCj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHJtL3Rhc2tfYmFycmllci5oCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdGFz
a19iYXJyaWVyLmggYi9pbmNsdWRlL2RybS90YXNrX2JhcnJpZXIuaAo+Pj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMC4uODFmYjBmNwo+Pj4+IC0tLSAvZGV2L251bGwK
Pj4+PiArKysgYi9pbmNsdWRlL2RybS90YXNrX2JhcnJpZXIuaAo+Pj4+IEBAIC0wLDAgKzEsMTA2
IEBACj4+Pj4gKy8qCj4+Pj4gKyAqIENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERldmlj
ZXMsIEluYy4KPj4+PiArICoKPj4+PiArICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwg
ZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24KPj4+PiBvYnRhaW5pbmcgYQo+Pj4+ICsgKiBj
b3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAo
dGhlCj4+Pj4gIlNvZnR3YXJlIiksCj4+Pj4gKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdp
dGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0Cj4+Pj4gbGltaXRhdGlvbgo+Pj4+
ICsgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlz
dHJpYnV0ZSwKPj4+PiBzdWJsaWNlbnNlLAo+Pj4+ICsgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2Yg
dGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8KPj4+PiB3aG9tIHRoZQo+Pj4+
ICsgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxv
d2luZwo+Pj4+IGNvbmRpdGlvbnM6Cj4+Pj4gKyAqCj4+Pj4gKyAqIFRoZSBhYm92ZSBjb3B5cmln
aHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlCj4+Pj4gaW5jbHVk
ZWQgaW4KPj4+PiArICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUg
U29mdHdhcmUuCj4+Pj4gKyAqCj4+Pj4gKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMg
SVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELAo+Pj4+IEVYUFJFU1MgT1IKPj4+PiAr
ICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBP
Rgo+Pj4+IE1FUkNIQU5UQUJJTElUWSwKPj4+PiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
IFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PCj4+Pj4gRVZFTlQgU0hBTEwKPj4+
PiArICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1Ig
QU5ZIENMQUlNLAo+Pj4+IERBTUFHRVMgT1IKPj4+PiArICogT1RIRVIgTElBQklMSVRZLCBXSEVU
SEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUgo+Pj4+IE9USEVSV0lTRSwKPj4+
PiArICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZU
V0FSRSBPUiBUSEUKPj4+PiBVU0UgT1IKPj4+PiArICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNP
RlRXQVJFLgo+Pj4+ICsgKgo+Pj4+ICsgKi8KPj4+PiArI2luY2x1ZGUgPGxpbnV4L3NlbWFwaG9y
ZS5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvYXRvbWljLmg+Cj4+Pj4gKwo+Pj4+ICsvKgo+Pj4+
ICsgKiBSZXVzYWJsZSAyIFBIQVNFIHRhc2sgYmFycmllciAocmFuZGV2b3V6IHBvaW50KSBpbXBs
ZW1lbnRhdGlvbgo+Pj4+IGZvciBOIHRhc2tzLgo+Pj4+ICsgKiBCYXNlZCBvbiB0aGUgTGl0dGxl
IGJvb2sgb2Ygc2VtcGFob3JlcyAtCj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ3JlZW50ZWFwcmVzcy5jb20lMkZ3
cCUyRnNlbWFwaG9yZXMlMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q2FuZHJleS5ncm9kem92c2t5JTQw
YW1kLmNvbSU3Qzk2ZjhjMjhhZTRiZDQzZjI5MjIyMDhkNzdlZGRiNjBmJTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzExNzM2MzAyOTA2Mjk5NSZhbXA7c2Rh
dGE9NnhYWlh5RElLbVFNOEVUNWhQSVolMkZiSnJPTVFxSzRvWXc4ZEdZUzFyeGNZJTNEJmFtcDty
ZXNlcnZlZD0wCj4+Pj4gKyAqLwo+Pj4+ICsKPj4+PiArCj4+Pj4gKwo+Pj4+ICsjaWZuZGVmIERS
TV9UQVNLX0JBUlJJRVJfSF8KPj4+PiArI2RlZmluZSBEUk1fVEFTS19CQVJSSUVSX0hfCj4+Pj4g
Kwo+Pj4+ICsvKgo+Pj4+ICsgKiBSZXByZXNlbnRzIGFuIGluc3RhbmNlIG9mIGEgdGFzayBiYXJy
aWVyLgo+Pj4+ICsgKi8KPj4+PiArc3RydWN0IHRhc2tfYmFycmllciB7Cj4+Pj4gKyAgICAgICB1
bnNpZ25lZCBpbnQgbjsKPj4+PiArICAgICAgIGF0b21pY190IGNvdW50Owo+Pj4+ICsgICAgICAg
c3RydWN0IHNlbWFwaG9yZSBlbnRlcl90dXJuc3RpbGU7Cj4+Pj4gKyAgICAgICBzdHJ1Y3Qgc2Vt
YXBob3JlIGV4aXRfdHVybnN0aWxlOwo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiArc3RhdGljIGlubGlu
ZSB2b2lkIHRhc2tfYmFycmllcl9zaWduYWxfdHVybnN0aWxlKHN0cnVjdCBzZW1hcGhvcmUKPj4+
PiAqdHVybnN0aWxlLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgbikKPj4+PiArewo+Pj4+ICsgICAgICAgaW50IGk7Cj4+
Pj4gKwo+Pj4+ICsgICAgICAgZm9yIChpID0gMCA7IGkgPCBuOyBpKyspCj4+Pj4gKyAgICAgICAg
ICAgICAgIHVwKHR1cm5zdGlsZSk7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCB0YXNrX2JhcnJpZXJfaW5pdChzdHJ1Y3QgdGFza19iYXJyaWVyICp0YikKPj4+PiArewo+
Pj4+ICsgICAgICAgdGItPm4gPSAwOwo+Pj4+ICsgICAgICAgYXRvbWljX3NldCgmdGItPmNvdW50
LCAwKTsKPj4+PiArICAgICAgIHNlbWFfaW5pdCgmdGItPmVudGVyX3R1cm5zdGlsZSwgMCk7Cj4+
Pj4gKyAgICAgICBzZW1hX2luaXQoJnRiLT5leGl0X3R1cm5zdGlsZSwgMCk7Cj4+Pj4gK30KPj4+
PiArCj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0YXNrX2JhcnJpZXJfYWRkX3Rhc2soc3RydWN0
IHRhc2tfYmFycmllciAqdGIpCj4+Pj4gK3sKPj4+PiArICAgICAgIHRiLT5uKys7Cj4+Pj4gK30K
Pj4+PiArCj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0YXNrX2JhcnJpZXJfcmVtX3Rhc2soc3Ry
dWN0IHRhc2tfYmFycmllciAqdGIpCj4+Pj4gK3sKPj4+PiArICAgICAgIHRiLT5uLS07Cj4+Pj4g
K30KPj4+PiArCj4+Pj4gKy8qCj4+Pj4gKyAqIExpbmVzIHVwIGFsbCB0aGUgdGhyZWFkcyBCRUZP
UkUgdGhlIGNyaXRpY2FsIHBvaW50Lgo+Pj4+ICsgKgo+Pj4+ICsgKiBXaGVuIGFsbCB0aHJlYWQg
cGFzc2VkIHRoaXMgY29kZSB0aGUgZW50cnkgYmFycmllciBpcyBiYWNrIHRvCj4+Pj4gbG9ja2Vk
IHN0YXRlLgo+Pj4+ICsgKi8KPj4+PiArc3RhdGljIGlubGluZSB2b2lkIHRhc2tfYmFycmllcl9l
bnRlcihzdHJ1Y3QgdGFza19iYXJyaWVyICp0YikKPj4+PiArewo+Pj4+ICsgICAgICAgaWYgKGF0
b21pY19pbmNfcmV0dXJuKCZ0Yi0+Y291bnQpID09IHRiLT5uKQo+Pj4+ICsgdGFza19iYXJyaWVy
X3NpZ25hbF90dXJuc3RpbGUoJnRiLT5lbnRlcl90dXJuc3RpbGUsIHRiLT5uKTsKPj4+PiArCj4+
Pj4gKyAgICAgICBkb3duKCZ0Yi0+ZW50ZXJfdHVybnN0aWxlKTsKPj4+PiArfQo+Pj4+ICsKPj4+
PiArLyoKPj4+PiArICogTGluZXMgdXAgYWxsIHRoZSB0aHJlYWRzIEFGVEVSIHRoZSBjcml0aWNh
bCBwb2ludC4KPj4+PiArICoKPj4+PiArICogVGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGF2b2lk
IGFueSBvbmUgdGhyZWFkIHJ1bm5pbmcgYWhlYWQgb2YKPj4+PiB0aGUgcmVzZXQgaWYKPj4+PiAr
ICogdGhlIGJhcnJpZXIgaXMgdXNlZCBpbiBhIGxvb3AgKHJlcGVhdGVkbHkpIC4KPj4+PiArICov
Cj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0YXNrX2JhcnJpZXJfZXhpdChzdHJ1Y3QgdGFza19i
YXJyaWVyICp0YikKPj4+PiArewo+Pj4+ICsgICAgICAgaWYgKGF0b21pY19kZWNfcmV0dXJuKCZ0
Yi0+Y291bnQpID09IDApCj4+Pj4gKyB0YXNrX2JhcnJpZXJfc2lnbmFsX3R1cm5zdGlsZSgmdGIt
PmV4aXRfdHVybnN0aWxlLCB0Yi0+bik7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgZG93bigmdGItPmV4
aXRfdHVybnN0aWxlKTsKPj4+PiArfQo+Pj4+ICsKPj4+PiArc3RhdGljIGlubGluZSB2b2lkIHRh
c2tfYmFycmllcl9mdWxsKHN0cnVjdCB0YXNrX2JhcnJpZXIgKnRiKQo+Pj4+ICt7Cj4+Pj4gKyAg
ICAgICB0YXNrX2JhcnJpZXJfZW50ZXIodGIpOwo+Pj4+ICsgICAgICAgdGFza19iYXJyaWVyX2V4
aXQodGIpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICsjZW5kaWYKPj4+PiAtLQo+Pj4+IDIuNy40Cj4+
Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
Pj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGlu
Zm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NhbmRyZXkuZ3JvZHpvdnNreSU0MGFtZC5j
b20lN0M5NmY4YzI4YWU0YmQ0M2YyOTIyMjA4ZDc3ZWRkYjYwZiU3QzNkZDg5NjFmZTQ4ODRlNjA4
ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcxMTczNjMwMjkwNjc5OTQmYW1wO3NkYXRhPTRz
a0VHR2ZZQm1RY28lMkZhQ1huZVd1UjFwOGwlMkYwSlM4SXJMTnglMkJkZHp4b3MlM0QmYW1wO3Jl
c2VydmVkPTAKPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0
aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3Q2FuZHJleS5ncm9kem92c2t5JTQwYW1k
LmNvbSU3Qzk2ZjhjMjhhZTRiZDQzZjI5MjIyMDhkNzdlZGRiNjBmJTdDM2RkODk2MWZlNDg4NGU2
MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzExNzM2MzAyOTA2Nzk5NCZhbXA7c2RhdGE9
NHNrRUdHZllCbVFjbyUyRmFDWG5lV3VSMXA4bCUyRjBKUzhJckxOeCUyQmRkenhvcyUzRCZhbXA7
cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
