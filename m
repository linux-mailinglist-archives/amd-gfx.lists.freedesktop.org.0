Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D81CB40E
	for <lists+amd-gfx@lfdr.de>; Fri,  8 May 2020 17:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FA06EB27;
	Fri,  8 May 2020 15:54:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9CD6E25D;
 Fri,  8 May 2020 15:54:57 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id e8so1834710ilm.7;
 Fri, 08 May 2020 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lE6TySu7iinzrBIFIK/3S/tHlrJXULxoGhhSeUA1d7A=;
 b=Ih0cGMuikGf5YWrscJk/mkld7qTw/BsZXkeNaYgySkD13fyLg7EzMjgxTAgUw6hCtn
 QaY5a1ELQuaAxfHVVrQPG2BDF4D6pduWtKhfJnHFobqU7Y/n3gUBAMC3/8plHG5qxZvI
 Ic5XqkdhmGgOZPZ9Yc/AoXmSGFT3O+xxvgFdGjs3N3bJBTwvQNAnZ9ApGJ79hPyHJ5up
 xEaXukU0ee1T/4RUhdM5Ix9jh7/kkH5ZNQtjmInE3vTV1PBGbjxX55f7aFhNQgDcrqdv
 Z1Mvl7XlRDYtId0r/GnQsCOpVTQkM47M1+FWV8556GS543UxUZ1v6e4N06eeH0RLOaYg
 6oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lE6TySu7iinzrBIFIK/3S/tHlrJXULxoGhhSeUA1d7A=;
 b=P4Lj/kfjy1MwdFkserw6z5bY/rZw+aFX41DDGmTqONf25/VE8TClwoJxkm2DvV8qds
 aHATIdzDzN31TQD1S4Qj5uAvfW9HCcgYJkBK5F+FzSslxw9GaTwpKhEMvTpuZZFmEb4m
 0GQrRIXjDMtsx3HQf0FY3NysjNhISliIaKjSXl1olqYwaeYWWtVbLBviB+hdxFzxi41O
 oOZibNdgjEsn8Sr6nsfkBprSPTNX7XcBoGlAK+z2Dri1NIwO30egnTDzQFq+ALfz9xEM
 5662JFqBS9VUwR6v6ycXA/6nOkkLVJivMDTfscPDGAtR7bHGCoOe2LNl/loBilBy9tWG
 cR4Q==
X-Gm-Message-State: AGi0PubSA1g4UcCL8WcpXaF92nCIPLNLM8SJrg86o7IBojCZG1sTqJX3
 9D8rDZ4+/3O4p7R73dt4/fOrHls77dxBrg==
X-Google-Smtp-Source: APiQypKokLa7ii/cdTdl/Xrzdod4bP4eqLwZm+Zc3Iu3xcZ/FnqTsws6BtzIgE80Ewrab8ZXDa1ljw==
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr3614299ilq.131.1588953296984; 
 Fri, 08 May 2020 08:54:56 -0700 (PDT)
Received: from ?IPv6:2602:47:da99:d200:6d4:c4ff:fe4a:ea6b?
 ([2602:47:da99:d200:6d4:c4ff:fe4a:ea6b])
 by smtp.gmail.com with ESMTPSA id 140sm967577ilc.44.2020.05.08.08.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 08:54:56 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/display: Fix pageflip event race condition for
 DCN. (v2)
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20200305212044.3857-1-mario.kleiner.de@gmail.com>
 <CADnq5_PoEbgyQ1a+DMkSpTkN2QHHEpHie53Wxo7eRktsKxKs7Q@mail.gmail.com>
 <cd4b7cfd-1fec-db5a-ded1-65e89b14ea35@amd.com>
 <41ab0520-e29a-b6ed-bf5e-fbdf1eec0ceb@daenzer.net>
 <ec27e398-d40a-1abd-cd24-7d84ddb7ca85@gmail.com>
 <f158dc9e-0441-bdd3-0e57-5f4e15e6456f@gmail.com>
 <CADnq5_NxHKh=DG36H-MDYPL0Z+eAjJ3rv5t+BcAuX1V0Sbigqw@mail.gmail.com>
 <a7727c12-e482-e4c6-6d72-bdfe2cb53965@amd.com>
From: Matt Coffin <mcoffin13@gmail.com>
Autocrypt: addr=mcoffin13@gmail.com; keydata=
 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
 tuwClJVHcEqY1gkUE/HKR1MQFfXl979G/1Ql1g==
Message-ID: <7e5c30f1-6b22-abb9-20c6-44635cb8af08@gmail.com>
Date: Fri, 8 May 2020 09:54:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a7727c12-e482-e4c6-6d72-bdfe2cb53965@amd.com>
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
Cc: Mario Kleiner <mario.kleiner.de@gmail.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SnVzdCB0byBmb2xsb3cgdXAgb24gdGhpcywgSSBkZWNpZGVkIG5vdCB0byBmaWxlIHRoZSByZXBv
cnQsIHNpbmNlCk5pY2sncyBsYXRlc3QgcGF0Y2ggdGhhdCAiRml4ZXM6IiB0aGlzIGhhcyBmaXhl
ZCBteSBpc3N1ZS4gVGhhbmtzIGZvcgp0aGUgZ29vZCB3b3JrIG9uIHRoYXQgb25lIE5pY2suCgpN
aWdodCB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IG1ha2VzIGl0IGluIHRvIHRoZSA1LjcgZml4ZXMg
OikKClRoYW5rcyBhZ2FpbiBndXlzLgoKfk1hdHQKCk9uIDUvNS8yMCAxMTo1OSBBTSwgS2F6bGF1
c2thcywgTmljaG9sYXMgd3JvdGU6Cj4gQ2FuIHlvdSBmaWxlIGEgZnVsbCBidWcgcmVwb3J0IG9u
IHRoZSBnaXRsYWIgdHJhY2tlcj8KPiAKPiBGcmVlU3luYyBpcyBzdGlsbCB3b3JraW5nIG9uIG15
IE5hdmkgc2V0dXBzIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkLCBhbmQKPiB0aGlzIHBhdGNoIGlz
IGVzc2VudGlhbGx5IGp1c3QgYSByZXZlcnQgb2YgYW5vdGhlciBwYXRjaCBhbHJlYWR5ICh3aGVy
ZQo+IEZyZWVTeW5jIHdvcmtlZCBiZWZvcmUpLgo+IAo+IEkgY2FuIHVuZGVyc3RhbmQgdGhlIHYy
IG9mIHRoaXMgc2VyaWVzIGNhdXNpbmcgaXNzdWVzLCBidXQgdGhlIHYxCj4gc2hvdWxkbid0IGJl
IC0gc28gSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCBtb3JlIGFib3V0IHRoZSBzZXR1cCB3aGVyZSB0
aGlzCj4gaXMgY2F1c2luZyBpc3N1ZXMgLSBBU0lDLCBPUywgY29tcG9zaXRvciwgZGlzcGxheXMs
IGRtZXNnIGxvZywgWCBsb2csIGV0Yy4KPiAKPiBSZWdhcmRzLAo+IE5pY2hvbGFzIEthemxhdXNr
YXMKPiAKPiBPbiAyMDIwLTA1LTA1IDE6MDMgcC5tLiwgQWxleCBEZXVjaGVyIHdyb3RlOgo+PiBN
YXJpbyBvciBOaWNrIGFueSB0aG91Z2h0cz8KPj4KPj4gQWxleAo+Pgo+PiBPbiBNb24sIE1heSA0
LCAyMDIwIGF0IDE6MzUgUE0gTWF0dCBDb2ZmaW4gPG1jb2ZmaW4xM0BnbWFpbC5jb20+IHdyb3Rl
Ogo+Pj4KPj4+IEhleSBndXlzLAo+Pj4KPj4+IFRoaXMgaXMgc3RpbGwgYW4gaXNzdWUgZm9yIG1l
LCBhbmQgSSdtIHN0aWxsIGhhdmluZyB0byBydW4gYSBwYXRjaCB0bwo+Pj4gcmV2ZXJ0IHRoaXMg
YXMgb2YgNS43LXJjNC4gVG8gYXZvaWQgYnJlYWtpbmcgYSBsb3Qgb2YgcGVvcGxlJ3MgTmF2aQo+
Pj4gc2V0dXBzIGluIDUuNywgaXMgdGhlcmUgYW55IG5ld3Mgb24gdGhpcz8gSGFzIGFueW9uZSBl
bHNlIGF0IHRoZSB2ZXJ5Cj4+PiBsZWFzdCBiZWVuIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBwcm9i
bGVtPwo+Pj4KPj4+IEl0IGhhcHBlbnMgZm9yIG1lIGluIGV2ZXJ5IHNpbmdsZSBwcm9ncmFtIHRo
YXQgbWVzYSBhbGxvd3MgdG8gdXRpbGl6ZQo+Pj4gdmFyaWFibGUgcmVmcmVzaCByYXRlcywgYW5k
IHJldmVydGluZyBpdCAiZml4ZXMiIHRoZSBpc3N1ZS4KPj4+Cj4+PiBDaGVlcnMsIGFuZCBzb3Jy
eSBmb3IgdGhlIGV4dHJhIGVtYWlsLCBqdXN0IG1ha2luZyBzdXJlIHRoaXMgaXMgc3RpbGwgb24K
Pj4+IHNvbWVvbmUncyByYWRhciwKPj4+IE1hdHQKPj4+Cj4+PiBPbiA0LzE0LzIwIDU6MzIgUE0s
IE1hdHQgQ29mZmluIHdyb3RlOgo+Pj4+IEhleSBldmVyeW9uZSwKPj4+Pgo+Pj4+IFRoaXMgcGF0
Y2ggYnJva2UgdmFyaWFibGUgcmVmcmVzaCByYXRlIGluIGdhbWVzIChhbGwgdGhhdCBJJ3ZlIHRy
aWVkIHNvCj4+Pj4gZmFyLi4uIFByb2plY3QgQ0FSUyAyLCBEaVJUIFJhbGx5IDIuMCwgQXNzZXR0
byBDb3JzYSBDb21wZXRpemlvbmUpIGFzCj4+Pj4gd2VsbCBhcyBhIHNpbXBsZSBmcmVlc3luYyB0
ZXN0ZXIgYXBwbGljYXRpb24uCj4+Pj4KPj4+PiBGcmVlU3luYyB0ZXN0ZXIgSSd2ZSBiZWVuIHVz
aW5nOiBodHRwczovL2dpdGh1Yi5jb20vTml4b2xhL1ZSUlRlc3QKPj4+Pgo+Pj4+IEknbSBub3Qg
YXQgYWxsIGZhbWlsaWFyIHdpdGggdGhlIHBhZ2UgZmxpcHBpbmcgY29kZSwgc28gaXQgd291bGQK
Pj4+PiB0YWtlIG1lCj4+Pj4gYSBsb25nIHRpbWUgdG8gZmluZCB0aGUgKnJpZ2h0KiB3YXkgdG8g
Zml4IGl0LCBidXQgZG9lcyBzb21lb25lIGVsc2UKPj4+PiBzZWUKPj4+PiB3aHkgaXQgd291bGQg
ZG8gdGhhdD8KPj4+Pgo+Pj4+IFRoZSBzeW1wdG9tIGlzIHRoYXQgdGhlIHJlZnJlc2ggcmF0ZSBv
ZiB0aGUgZGlzcGxheSBjb25zdGFudGx5IGJvdW5jZXMKPj4+PiBiZXR3ZWVuIHRoZSB0d28gZW5k
cyBvZiB0aGUgRnJlZVN5bmMgcmFuZ2UgKGZvciBtZSA0MCAtPiAxNDQpLCBhbmQgdGhlCj4+Pj4g
Z2FtZSBzdHV0dGVycyBsaWtlIGEgbWFkbWFuLgo+Pj4+Cj4+Pj4gQW55IGhlbHAgb24gd2hlcmUg
dG8gc3RhcnQsIGlkZWFzIG9uIGhvdyB0byBmaXggaXQgKG90aGVyIHRoYW4ganVzdAo+Pj4+IHJl
dmVydCB0aGlzIGNvbW1pdCwgd2hpY2ggSSd2ZSBkb25lIGluIHRoZSBpbnRlcmltKSwgb3IgYWx0
ZXJuYXRpdmUKPj4+PiBwYXRjaGVzIHdvdWxkIGJlIGFwcHJlY2lhdGVkLgo+Pj4+Cj4+Pj4gVGhh
bmtzIGluIGFkdmFuY2UgZm9yIHRoZSB3b3JrL2hlbHAsCj4+Pj4gTWF0dAo+Pj4+Cj4+Pj4gT24g
My8xMy8yMCA4OjQyIEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+Pj4gT24gMjAyMC0wMy0x
MyAxOjM1IHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+Pj4+Pj4gT24gMjAyMC0w
My0xMiAxMDozMiBhLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4+Pj4+Pj4gT24gVGh1LCBNYXIg
NSwgMjAyMCBhdCA0OjIxIFBNIE1hcmlvIEtsZWluZXIKPj4+Pj4+PiA8bWFyaW8ua2xlaW5lci5k
ZUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDb21taXQgJzE2ZjE3ZWRhOGJh
ZCAoImRybS9hbWQvZGlzcGxheTogU2VuZCB2YmxhbmsgYW5kIHVzZXIKPj4+Pj4+Pj4gZXZlbnRz
IGF0IHZzYXJ0dXAgZm9yIERDTiIpJyBpbnRyb2R1Y2VzIGEgbmV3IHdheSBvZiBwYWdlZmxpcAo+
Pj4+Pj4+PiBjb21wbGV0aW9uIGhhbmRsaW5nIGZvciBEQ04sIGFuZCBzb21lIHRyb3VibGUuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGludHJvZHVjZXMgYSBy
YWNlIGNvbmRpdGlvbiwgd2hpY2gKPj4+Pj4+Pj4gY2FuIGNhdXNlIHBhZ2VmbGlwIGNvbXBsZXRp
b24gZXZlbnRzIHRvIGJlIHNlbnQgb3V0IG9uZSB2YmxhbmsKPj4+Pj4+Pj4gdG9vIGVhcmx5LCB0
aGVyZWJ5IGNvbmZ1c2luZyB1c2Vyc3BhY2UgYW5kIGNhdXNpbmcgZmxpY2tlcjoKPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gcHJlcGFyZV9mbGlwX2lzcigpOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAxLiBQYWdlZmxp
cCBwcm9ncmFtbWluZyB0YWtlcyB0aGUgZGRldi0+ZXZlbnRfbG9jay4KPj4+Pj4+Pj4gMi4gU2V0
cyBhY3J0Yy0+cGZsaXBfc3RhdHVzID09IEFNREdQVV9GTElQX1NVQk1JVFRFRAo+Pj4+Pj4+PiAz
LiBSZWxlYXNlcyBkZGV2LT5ldmVudF9sb2NrLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAtLT4gRGVhZGxp
bmUgZm9yIHN1cmZhY2UgYWRkcmVzcyByZWdzIGRvdWJsZS1idWZmZXJpbmcgcGFzc2VzIG9uCj4+
Pj4+Pj4+IMKgwqDCoMKgwqAgdGFyZ2V0IHBpcGUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDQuIGRjX2Nv
bW1pdF91cGRhdGVzX2Zvcl9zdHJlYW0oKSBNTUlPIHByb2dyYW1zIHRoZSBuZXcgcGFnZWZsaXAK
Pj4+Pj4+Pj4gwqDCoMKgwqAgaW50byBodywgYnV0IHRvbyBsYXRlIGZvciBjdXJyZW50IHZibGFu
ay4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gPT4gcGZsaXBfc3RhdHVzID09IEFNREdQVV9GTElQX1NVQk1J
VFRFRCwgYnV0IGZsaXAgd29uJ3QgY29tcGxldGUKPj4+Pj4+Pj4gwqDCoMKgwqAgaW4gY3VycmVu
dCB2YmxhbmsgZHVlIHRvIG1pc3NpbmcgdGhlIGRvdWJsZS1idWZmZXJpbmcgZGVhZGxpbmUKPj4+
Pj4+Pj4gwqDCoMKgwqAgYnkgYSB0aW55IGJpdC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gNS4gVlNUQVJU
VVAgdHJpZ2dlciBwb2ludCBpbiB2YmxhbmsgaXMgcmVhY2hlZCwgVlNUQVJUVVAgaXJxIGZpcmVz
LAo+Pj4+Pj4+PiDCoMKgwqDCoCBkbV9kY25fY3J0Y19oaWdoX2lycSgpIGdldHMgY2FsbGVkLgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiA2LiBEZXRlY3RzIHBmbGlwX3N0YXR1cyA9PSBBTURHUFVfRkxJUF9T
VUJNSVRURUQgYW5kIGFzc3VtZXMgdGhlCj4+Pj4+Pj4+IMKgwqDCoMKgIHBhZ2VmbGlwIGhhcyBi
ZWVuIGNvbXBsZXRlZC93aWxsIGNvbXBsZXRlIGluIHRoaXMgdmJsYW5rIGFuZAo+Pj4+Pj4+PiDC
oMKgwqDCoCBzZW5kcyBvdXQgcGFnZWZsaXAgY29tcGxldGlvbiBldmVudCB0byB1c2Vyc3BhY2Ug
YW5kIHJlc2V0cwo+Pj4+Pj4+PiDCoMKgwqDCoCBwZmxpcF9zdGF0dXMgPSBBTURHUFVfRkxJUF9O
T05FLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiA9PiBGbGlwIGNvbXBsZXRpb24gZXZlbnQgc2VudCBvdXQg
b25lIHZibGFuayB0b28gZWFybHkuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgYmVoYXZpb3VyIGhh
cyBiZWVuIG9ic2VydmVkIGR1cmluZyBteSB0ZXN0aW5nIHdpdGggbWVhc3VyZW1lbnQKPj4+Pj4+
Pj4gaGFyZHdhcmUgYSBjb3VwbGUgb2YgdGltZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhlIGNvbW1p
dCBtZXNzYWdlIHNheXMgdGhhdCB0aGUgZXh0cmEgZmxpcCBldmVudCBjb2RlIHdhcyBhZGRlZCB0
bwo+Pj4+Pj4+PiBkbV9kY25fY3J0Y19oaWdoX2lycSgpIHRvIHByZXZlbnQgbWlzc2luZyB0byBz
ZW5kIG91dCBwYWdlZmxpcAo+Pj4+Pj4+PiBldmVudHMKPj4+Pj4+Pj4gaW4gY2FzZSB0aGUgcGZs
aXAgaXJxIGRvZXNuJ3QgZmlyZSwgYmVjYXVzZSB0aGUgIkRDSCBIVUJQIgo+Pj4+Pj4+PiBjb21w
b25lbnQKPj4+Pj4+Pj4gaXMgY2xvY2sgZ2F0ZWQgYW5kIGRvZXNuJ3QgZmlyZSBwZmxpcCBpcnFz
IGluIHRoYXQgc3RhdGUuIEFsc28gdGhhdAo+Pj4+Pj4+PiB0aGlzIGNsb2NrIGdhdGluZyBtYXkg
aGFwcGVuIGlmIG5vIHBsYW5lcyBhcmUgYWN0aXZlLiBBY2NvcmRpbmcgdG8KPj4+Pj4+Pj4gTmlj
aG9sYXMsIHRoZSBjbG9jayBnYXRpbmcgY2FuIGFsc28gaGFwcGVuIGlmIHBzciBpcyBhY3RpdmUs
IGFuZAo+Pj4+Pj4+PiB0aGUKPj4+Pj4+Pj4gZ2F0aW5nIGlzIGNvbnRyb2xsZWQgaW5kZXBlbmRl
bnRseSBieSB0aGUgaGFyZHdhcmUsIHNvIGRpZmZpY3VsdCB0bwo+Pj4+Pj4+PiBkZXRlY3QgaWYg
YW5kIHdoZW4gdGhlIGNvbXBsZXRpb24gY29kZSBpbiBhYm92ZSBjb21taXQgaXMgbmVlZGVkLgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGlzIHBhdGNoIHRyaWVzIHRoZSBmb2xsb3dpbmcgc29sdXRpb246
IEl0IG9ubHkgZXhlY3V0ZXMgdGhlIGV4dHJhCj4+Pj4+Pj4+IHBmbGlwCj4+Pj4+Pj4+IGNvbXBs
ZXRpb24gY29kZSBpbiBkbV9kY25fY3J0Y19oaWdoX2lycSgpIGlmZiB0aGUgaGFyZHdhcmUgcmVw
b3J0cwo+Pj4+Pj4+PiB0aGF0IHRoZXJlIGFyZW4ndCBhbnkgc3VyZmFjZSB1cGRhdGVkIHBlbmRp
bmcgaW4gdGhlCj4+Pj4+Pj4+IGRvdWJsZS1idWZmZXJlZAo+Pj4+Pj4+PiBzdXJmYWNlIHNjYW5v
dXQgYWRkcmVzcyByZWdpc3RlcnMuIE90aGVyd2lzZSBpdCBsZWF2ZXMgcGZsaXAKPj4+Pj4+Pj4g
Y29tcGxldGlvbgo+Pj4+Pj4+PiB0byB0aGUgcGZsaXAgaXJxIGhhbmRsZXIsIGZvciBhIG1vcmUg
cmFjZS1mcmVlIGV4cGVyaWVuY2UuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgd291bGQgb25seSBn
dWFyZCBhZ2FpbnN0IHRoZSBvcmRlciBvZiBldmVudHMgbWVudGlvbmVkIGFib3ZlLgo+Pj4+Pj4+
PiBJZiBTdGVwIDUgKFZTVEFSVFVQIHRyaWdnZXIpIGhhcHBlbnMgYmVmb3JlIHN0ZXAgNCB0aGVu
IHRoaXMKPj4+Pj4+Pj4gd29uJ3QgaGVscAo+Pj4+Pj4+PiBhdCBhbGwsIGJlY2F1c2UgMS0zICsg
NSBtaWdodCBoYXBwZW4gZXZlbiB3aXRob3V0IHRoZSBodyBiZWluZwo+Pj4+Pj4+PiBwcm9ncmFt
bWVkCj4+Pj4+Pj4+IGF0IGFsbCwgaWUuIG5vIHN1cmZhY2UgdXBkYXRlIHBlbmRpbmcgYmVjYXVz
ZSBub25lIHlldCBwcm9ncmFtbWVkCj4+Pj4+Pj4+IGludG8gaHcuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IFRoZXJlZm9yZSB0aGlzIHBhdGNoIGFsc28gY2hhbmdlcyBsb2NraW5nIGluCj4+Pj4+Pj4+IGFt
ZGdwdV9kbV9jb21taXRfcGxhbmVzKCksCj4+Pj4+Pj4+IHNvIHRoYXQgcHJlcGFyZV9mbGlwX2lz
cigpIGFuZCBkY19jb21taXRfdXBkYXRlc19mb3Jfc3RyZWFtKCkKPj4+Pj4+Pj4gYXJlIGRvbmUK
Pj4+Pj4+Pj4gdW5kZXIgZXZlbnRfbG9jayBwcm90ZWN0aW9uIHdpdGhpbiB0aGUgc2FtZSBjcml0
aWNhbCBzZWN0aW9uLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiB2MjogVGFrZSBOaWNob2xhcyBjb21tZW50
cyBpbnRvIGFjY291bnQsIHRyeSBhIGRpZmZlcmVudCBzb2x1dGlvbi4KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gTGlnaHRseSB0ZXN0ZWQgb24gUG9sYXJpcyAobG9ja2luZykgYW5kIFJhdmVuICh0aGUgd2hv
bGUgRENOCj4+Pj4+Pj4+IHN0dWZmKS4KPj4+Pj4+Pj4gU2VlbXMgdG8gd29yayB3aXRob3V0IGNh
dXNpbmcgb2J2aW91cyBuZXcgdHJvdWJsZS4KPj4+Pj4+Pgo+Pj4+Pj4+IE5pY2ssIGFueSBjb21t
ZW50cyBvbiB0aGlzP8KgIENhbiB3ZSBnZXQgdGhpcyBjb21taXR0ZWQgb3IgZG8geW91Cj4+Pj4+
Pj4gdGhpbmsKPj4+Pj4+PiBpdCBuZWVkcyBhZGRpdGlvbmFsIHJld29yaz8KPj4+Pj4+Pgo+Pj4+
Pj4+IFRoYW5rcywKPj4+Pj4+Pgo+Pj4+Pj4+IEFsZXgKPj4+Pj4+Cj4+Pj4+PiBIaSBBbGV4LCBN
YXJpbywKPj4+Pj4+Cj4+Pj4+PiBUaGlzIG1pZ2h0IGJlIGEgbGl0dGxlIHN0cmFuZ2UsIGJ1dCBp
ZiB3ZSB3YW50IHRvIGdldCB0aGlzIGluIGFzIGEKPj4+Pj4+IGZpeAo+Pj4+Pj4gZm9yIHJlZ3Jl
c3Npb25zIGNhdXNlZCBieSB0aGUgb3JpZ2luYWwgdmJsYW5rIGFuZCB1c2VyIGV2ZW50cyBhdAo+
Pj4+Pj4gdnN0YXJ0dXAgcGF0Y2ggdGhlbiBJJ20gYWN0dWFsbHkgZ29pbmcgdG8gZ2l2ZSBteSBy
ZXZpZXdlZCBieSBvbiB0aGUKPj4+Pj4+ICp2MSogb2YgdGhpcyBwYXRjaCAoYnV0IG5vdCB0aGlz
IHYyKToKPj4+Pj4+Cj4+Pj4+PiBSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmlj
aG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgo+Pj4+Pj4KPj4+Pj4+IFlvdSBjYW4gZmVlbCBmcmVl
IHRvIGFwcGx5IHRoYXQgb25lLgo+Pj4+Pj4KPj4+Pj4+IFJlYXNvbiAxOiBBZnRlciBoYXZpbmcg
dGhvdWdodCBhYm91dCBpdCBzb21lIG1vcmUgSSBkb24ndCB0aGluayB3ZQo+Pj4+Pj4gZW5hYmxl
IGFueXRoaW5nIHRvZGF5IHRoYXQgaGFzIGh1YnAgcG93ZXJlZCBkb3duIGF0IHRoZSBzYW1lIHRp
bWUgd2UKPj4+Pj4+IGV4cGVjdCB0byBiZSB3YWl0aW5nIGZvciBhIGZsaXAgLSBlZy4gRE1DVSBw
b3dlcmluZyBkb3duIEhVQlAKPj4+Pj4+IGR1cmluZyBQU1IKPj4+Pj4+IGVudHJ5LiBTdGF0aWMg
c2NyZWVuIGludGVycnVwdCBzaG91bGQgaGFwcGVuIGFmdGVyIHRoYXQgZmxpcAo+Pj4+Pj4gZmlu
aXNoZXMgSQo+Pj4+Pj4gdGhpbmsuCj4+Pj4+Pgo+Pj4+Pj4gVGhlIENSVEMgY2FuIHN0aWxsIGJl
IHBvd2VyZWQgb24gd2l0aCB6ZXJvIHBsYW5lcywgYW5kIEkgZG9uJ3QKPj4+Pj4+IHRoaW5rIGFu
eQo+Pj4+Pj4gdXNlcnNwYWNlIGV4cGxpY2l0bHkgYXNrcyBmb3IgdmJsYW5rIGV2ZW50cyBpbiB0
aGlzIGNhc2UgYnV0IGl0Cj4+Pj4+PiBkb2Vzbid0Cj4+Pj4+PiBodXJ0IHRvIGhhdmUgdGhlIGNo
ZWNrLgo+Pj4+Pj4KPj4+Pj4+IFJlYXNvbiAyOiBUaGlzIG5ldyBwYXRjaCB3aWxsIG5lZWQgbXVj
aCBtb3JlIHRob3JvdWdoIHRlc3RpbmcgZnJvbQo+Pj4+Pj4gc2lkZQo+Pj4+Pj4gdG8gZnVsbHkg
dW5kZXJzdGFuZCB0aGUgY29uc2VxdWVuY2VzIG9mIGxvY2tpbmcgdGhlIGVudGlyZSBEQyBjb21t
aXQKPj4+Pj4+IHNlcXVlbmNlLiBGb3IganVzdCBhIHBhZ2UgZmxpcCB0aGF0IHNvdW5kcyBmaW5l
LCBidXQgZm9yIGFueXRoaW5nCj4+Pj4+PiBtb3JlCj4+Pj4+PiB0aGFuIChlZy4gZnVsbCB1cGRh
dGVzLCBtb2Rlc2V0cywgZXRjKSBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8gYmUKPj4+Pj4+IGRp
c2FibGluZyBpbnRlcnJ1cHRzIGZvciBwb3RlbnRpYWxseSBtYW55IG1pbGxpc2Vjb25kcy4KPj4+
Pj4KPj4+Pj4gQWghIEkgd2FzIHdvbmRlcmluZyB3aGVyZSB0aGUgYXR0YWNoZWQgc3BsYXQgY29t
ZXMgZnJvbSwgYnV0IEkgdGhpbmsKPj4+Pj4gdGhpcyBleHBsYWlucyBpdDogV2l0aCB0aGlzIHBh
dGNoIGFtZGdwdV9kbV9jb21taXRfcGxhbmVzIGtlZXBzIHRoZQo+Pj4+PiBwY3J0Yy0+ZGV2LT5l
dmVudF9sb2NrIHNwaW5sb2NrIGxvY2tlZCB3aGlsZSBjYWxsaW5nCj4+Pj4+IGRjX2NvbW1pdF91
cGRhdGVzX2Zvcl9zdHJlYW0sIHdoaWNoIGVuZHMgdXAgY2FsbGluZwo+Pj4+PiBzbXVfc2V0X2Rp
c3BsYXlfY291bnQsIHdoaWNoIHRyaWVzIHRvIGxvY2sgYSBtdXRleC4KPj4+Pj4KPj4+Pj4KPj4+
Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cj4+Pj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo=
