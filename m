Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D732B400C
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 10:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5A689DB8;
	Mon, 16 Nov 2020 09:42:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E38A889D6C;
 Mon, 16 Nov 2020 09:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id EECE52A6042;
 Mon, 16 Nov 2020 10:42:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 9T4zQiARZPYB; Mon, 16 Nov 2020 10:42:43 +0100 (CET)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 4DAB32A6045;
 Mon, 16 Nov 2020 10:42:43 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1keb22-000X1v-A2; Mon, 16 Nov 2020 10:42:42 +0100
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <6809de08-2035-edda-ebd2-05e7f77a1068@gmail.com>
 <cda48298-1e0b-7cad-7979-6d5c2f99ef94@amd.com>
 <78fd1669-e39b-d407-b558-f9ac76e494e2@amd.com>
 <CAKMK7uHa386Reo4q99sLQDaQR6nh6dgGm3duOq135h+kC2dLjA@mail.gmail.com>
 <a13a7893-a3dd-c4f6-0a0f-0fce8c005e53@amd.com>
 <fefd0ae2-7776-0e57-cc97-805f6237c82f@gmail.com>
 <CAKMK7uGzbiA=XSgNVLsimYO668L7yH1pakO+5T5cFmibSD9zvQ@mail.gmail.com>
 <CAKMK7uE1-iti4WL2=rr-YfRJNG+OkU6bakr+obR_jsfGbGo0=g@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
Message-ID: <e8d59bab-b6b8-b303-9e95-165cd0000e6e@daenzer.net>
Date: Mon, 16 Nov 2020 10:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE1-iti4WL2=rr-YfRJNG+OkU6bakr+obR_jsfGbGo0=g@mail.gmail.com>
Content-Language: en-CA
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0xNCAxMDo1NyBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFNhdCwg
Tm92IDE0LCAyMDIwIGF0IDEwOjUxIEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+IHdyb3RlOgo+Pgo+PiBPbiBTYXQsIE5vdiAxNCwgMjAyMCBhdCA5OjQxIEFNIENocmlz
dGlhbiBLw7ZuaWcKPj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToK
Pj4+Cj4+PiBBbSAxMy4xMS4yMCB1bSAyMTo1MiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+
Pj4+Cj4+Pj4gT24gNi8yMi8yMCAxOjUwIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+PiBP
biBNb24sIEp1biAyMiwgMjAyMCBhdCA3OjQ1IFBNIENocmlzdGlhbiBLw7ZuaWcKPj4+Pj4gPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4+Pj4+PiBBbSAyMi4wNi4yMCB1bSAxNjoz
MiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+IE9uIDYvMjIvMjAgOToxOCBBTSwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4gQW0gMjEuMDYuMjAgdW0gMDg6MDMgc2No
cmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4+IFdpbGwgYmUgdXNlZCB0byByZXJvdXRl
IENQVSBtYXBwZWQgQk8ncyBwYWdlIGZhdWx0cyBvbmNlCj4+Pj4+Pj4+PiBkZXZpY2UgaXMgcmVt
b3ZlZC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNr
eSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4gICAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jICB8ICA4ICsrKysrKysrCj4+Pj4+Pj4+PiAgICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMTAgKysrKysrKysrKwo+Pj4+Pj4+Pj4gICAg
IGluY2x1ZGUvZHJtL2RybV9maWxlLmggICAgICB8ICAyICsrCj4+Pj4+Pj4+PiAgICAgaW5jbHVk
ZS9kcm0vZHJtX2dlbS5oICAgICAgIHwgIDIgKysKPj4+Pj4+Pj4+ICAgICA0IGZpbGVzIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKykKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9maWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+Pj4+
Pj4+Pj4gaW5kZXggYzRjNzA0ZS4uNjdjMDc3MCAxMDA2NDQKPj4+Pj4+Pj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZpbGUuYwo+Pj4+Pj4+Pj4gQEAgLTE4OCw2ICsxODgsMTIgQEAgc3RydWN0IGRybV9maWxlICpk
cm1fZmlsZV9hbGxvYyhzdHJ1Y3QKPj4+Pj4+Pj4+IGRybV9taW5vciAqbWlub3IpCj4+Pj4+Pj4+
PiAgICAgICAgICAgICAgICAgZ290byBvdXRfcHJpbWVfZGVzdHJveTsKPj4+Pj4+Pj4+ICAgICAg
ICAgfQo+Pj4+Pj4+Pj4gICAgICsgICAgZmlsZS0+ZHVtbXlfcGFnZSA9IGFsbG9jX3BhZ2UoR0ZQ
X0tFUk5FTCB8IF9fR0ZQX1pFUk8pOwo+Pj4+Pj4+Pj4gKyAgICBpZiAoIWZpbGUtPmR1bW15X3Bh
Z2UpIHsKPj4+Pj4+Pj4+ICsgICAgICAgIHJldCA9IC1FTk9NRU07Cj4+Pj4+Pj4+PiArICAgICAg
ICBnb3RvIG91dF9wcmltZV9kZXN0cm95Owo+Pj4+Pj4+Pj4gKyAgICB9Cj4+Pj4+Pj4+PiArCj4+
Pj4+Pj4+PiAgICAgICAgIHJldHVybiBmaWxlOwo+Pj4+Pj4+Pj4gICAgICAgb3V0X3ByaW1lX2Rl
c3Ryb3k6Cj4+Pj4+Pj4+PiBAQCAtMjg0LDYgKzI5MCw4IEBAIHZvaWQgZHJtX2ZpbGVfZnJlZShz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCj4+Pj4+Pj4+PiAgICAgICAgIGlmIChkZXYtPmRyaXZlci0+
cG9zdGNsb3NlKQo+Pj4+Pj4+Pj4gICAgICAgICAgICAgZGV2LT5kcml2ZXItPnBvc3RjbG9zZShk
ZXYsIGZpbGUpOwo+Pj4+Pj4+Pj4gICAgICsgICAgX19mcmVlX3BhZ2UoZmlsZS0+ZHVtbXlfcGFn
ZSk7Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiBkcm1fcHJpbWVfZGVzdHJveV9maWxlX3ByaXZhdGUo
JmZpbGUtPnByaW1lKTsKPj4+Pj4+Pj4+ICAgICAgICAgICBXQVJOX09OKCFsaXN0X2VtcHR5KCZm
aWxlLT5ldmVudF9saXN0KSk7Cj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9wcmltZS5jCj4+Pj4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4+
Pj4+Pj4gaW5kZXggMWRlMmNkZS4uYzQ4MmU5YyAxMDA2NDQKPj4+Pj4+Pj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmltZS5jCj4+Pj4+Pj4+PiBAQCAtMzM1LDYgKzMzNSwxMyBAQCBpbnQgZHJtX2dlbV9wcmlt
ZV9mZF90b19oYW5kbGUoc3RydWN0Cj4+Pj4+Pj4+PiBkcm1fZGV2aWNlICpkZXYsCj4+Pj4+Pj4+
PiAgICAgICAgICAgcmV0ID0gZHJtX3ByaW1lX2FkZF9idWZfaGFuZGxlKCZmaWxlX3ByaXYtPnBy
aW1lLAo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgIGRtYV9idWYsICpoYW5kbGUpOwo+Pj4+Pj4+
Pj4gKwo+Pj4+Pj4+Pj4gKyAgICBpZiAoIXJldCkgewo+Pj4+Pj4+Pj4gKyAgICAgICAgb2JqLT5k
dW1teV9wYWdlID0gYWxsb2NfcGFnZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4+Pj4+Pj4+
PiArICAgICAgICBpZiAoIW9iai0+ZHVtbXlfcGFnZSkKPj4+Pj4+Pj4+ICsgICAgICAgICAgICBy
ZXQgPSAtRU5PTUVNOwo+Pj4+Pj4+Pj4gKyAgICB9Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+IFdoaWxl
IHRoZSBwZXIgZmlsZSBjYXNlIHN0aWxsIGxvb2tzIGFjY2VwdGFibGUgdGhpcyBpcyBhIGNsZWFy
IE5BSwo+Pj4+Pj4+PiBzaW5jZSBpdCB3aWxsIG1hc3NpdmVseSBpbmNyZWFzZSB0aGUgbWVtb3J5
IG5lZWRlZCBmb3IgYSBwcmltZQo+Pj4+Pj4+PiBleHBvcnRlZCBvYmplY3QuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IEkgdGhpbmsgdGhhdCB0aGlzIGlzIHF1aXRlIG92ZXJraWxsIGluIHRoZSBmaXJzdCBw
bGFjZSBhbmQgZm9yIHRoZQo+Pj4+Pj4+PiBob3QgdW5wbHVnIGNhc2Ugd2UgY2FuIGp1c3QgdXNl
IHRoZSBnbG9iYWwgZHVtbXkgcGFnZSBhcyB3ZWxsLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDaHJpc3Rp
YW4uCj4+Pj4+Pj4KPj4+Pj4+PiBHbG9iYWwgZHVtbXkgcGFnZSBpcyBnb29kIGZvciByZWFkIGFj
Y2Vzcywgd2hhdCBkbyB5b3UgZG8gb24gd3JpdGUKPj4+Pj4+PiBhY2Nlc3MgPyBNeSBmaXJzdCBh
cHByb2FjaCB3YXMgaW5kZWVkIHRvIG1hcCBhdCBmaXJzdCBnbG9iYWwgZHVtbXkKPj4+Pj4+PiBw
YWdlIGFzIHJlYWQgb25seSBhbmQgbWFyayB0aGUgdm1hLT52bV9mbGFncyBhcyAhVk1fU0hBUkVE
IGFzc3VtaW5nCj4+Pj4+Pj4gdGhhdCB0aGlzIHdvdWxkIHRyaWdnZXIgQ29weSBPbiBXcml0ZSBm
bG93IGluIGNvcmUgbW0KPj4+Pj4+PiAoaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZWxpeGlyLmJvb3RsaW4uY29tJTJGbGlu
dXglMkZ2NS43LXJjNyUyRnNvdXJjZSUyRm1tJTJGbWVtb3J5LmMlMjNMMzk3NyZhbXA7ZGF0YT0w
MiU3QzAxJTdDQW5kcmV5Lkdyb2R6b3Zza3klNDBhbWQuY29tJTdDMzc1MzQ1MWQwMzc1NDRlNzQ5
NTQwOGQ4MTZkNGM0ZWUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0Mw
JTdDNjM3Mjg0NDUwMzg0NTg2MTIwJmFtcDtzZGF0YT1acFJhUWdxQTVLNGpSZmlkT2llZGV5MEFs
ZWVZUTk3V05Va0dBMjlFUkEwJTNEJmFtcDtyZXNlcnZlZD0wKQo+Pj4+Pj4+Cj4+Pj4+Pj4gb24g
dGhlIG5leHQgcGFnZSBmYXVsdCB0byBzYW1lIGFkZHJlc3MgdHJpZ2dlcmVkIGJ5IGEgd3JpdGUg
YWNjZXNzIGJ1dAo+Pj4+Pj4+IHRoZW4gaSByZWFsaXplZCBhIG5ldyBDT1cgcGFnZSB3aWxsIGJl
IGFsbG9jYXRlZCBmb3IgZWFjaCBzdWNoIG1hcHBpbmcKPj4+Pj4+PiBhbmQgdGhpcyBpcyBtdWNo
IG1vcmUgd2FzdGVmdWwgdGhlbiBoYXZpbmcgYSBkZWRpY2F0ZWQgcGFnZSBwZXIgR0VNCj4+Pj4+
Pj4gb2JqZWN0Lgo+Pj4+Pj4gWWVhaCwgYnV0IHRoaXMgaXMgb25seSBmb3IgYSB2ZXJ5IHZlcnkg
c21hbGwgY29ybmVyIGNhc2VzLiBXaGF0IHdlIG5lZWQKPj4+Pj4+IHRvIHByZXZlbnQgaXMgaW5j
cmVhc2luZyB0aGUgbWVtb3J5IHVzYWdlIGR1cmluZyBub3JtYWwgb3BlcmF0aW9uIHRvCj4+Pj4+
PiBtdWNoLgo+Pj4+Pj4KPj4+Pj4+IFVzaW5nIG1lbW9yeSBkdXJpbmcgdGhlIHVucGx1ZyBpcyBj
b21wbGV0ZWx5IHVucHJvYmxlbWF0aWMgYmVjYXVzZSB3ZQo+Pj4+Pj4ganVzdCByZWxlYXNlZCBx
dWl0ZSBhIGJ1bmNoIG9mIGl0IGJ5IHJlbGVhc2luZyBhbGwgdGhvc2Ugc3lzdGVtIG1lbW9yeQo+
Pj4+Pj4gYnVmZmVycy4KPj4+Pj4+Cj4+Pj4+PiBBbmQgSSdtIHByZXR0eSBzdXJlIHRoYXQgQ09X
ZWQgcGFnZXMgYXJlIGNvcnJlY3RseSBhY2NvdW50ZWQgdG93YXJkcwo+Pj4+Pj4gdGhlCj4+Pj4+
PiB1c2VkIG1lbW9yeSBvZiBhIHByb2Nlc3MuCj4+Pj4+Pgo+Pj4+Pj4gU28gSSB0aGluayBpZiB0
aGF0IGFwcHJvYWNoIHdvcmtzIGFzIGludGVuZGVkIGFuZCB0aGUgQ09XIHBhZ2VzIGFyZQo+Pj4+
Pj4gcmVsZWFzZWQgYWdhaW4gb24gdW5tYXBwaW5nIGl0IHdvdWxkIGJlIHRoZSBwZXJmZWN0IHNv
bHV0aW9uIHRvIHRoZQo+Pj4+Pj4gcHJvYmxlbS4KPj4+Pj4+Cj4+Pj4+PiBEYW5pZWwgd2hhdCBk
byB5b3UgdGhpbms/Cj4+Pj4+IElmIENPVyB3b3Jrcywgc3VyZSBzb3VuZHMgcmVhc29uYWJsZS4g
QW5kIGlmIHdlIGNhbiBtYWtlIHN1cmUgd2UKPj4+Pj4gbWFuYWdlZCB0byBkcm9wIGFsbCB0aGUg
c3lzdGVtIGFsbG9jYXRpb25zIChvdGhlcndpc2Ugc3VkZGVubHkgMngKPj4+Pj4gbWVtb3J5IHVz
YWdlLCB3b3JzdCBjYXNlKS4gQnV0IEkgaGF2ZSBubyBpZGVhIHdoZXRoZXIgd2UgY2FuCj4+Pj4+
IHJldHJvc2hvZWhvcm4gdGhhdCBpbnRvIGFuIGVzdGFibGlzaGVkIHZtYSwgeW91IG1pZ2h0IGhh
dmUgZnVuIHN0dWZmCj4+Pj4+IGxpa2UgYSBta3dyaXRlIGhhbmRsZXIgdGhlcmUgKHdoaWNoIEkg
dGhvdWdodCBpcyB0aGUgQ09XIGhhbmRsZXIKPj4+Pj4gdGhpbmcsIGJ1dCByZWFsbHkgbm8gaWRl
YSkuCj4+Pj4+Cj4+Pj4+IElmIHdlIG5lZWQgdG8gbWFzc2l2ZWx5IGNoYW5nZSBzdHVmZiB0aGVu
IEkgdGhpbmsgcncgZHVtbXkgcGFnZSwKPj4+Pj4gYWxsb2NhdGVkIG9uIGZpcnN0IGZhdWx0IGFm
dGVyIGhvdHVucGx1ZyAobWF5YmUganVzdCBtYWtlIGl0IG9uZSBwZXIKPj4+Pj4gb2JqZWN0LCB0
aGF0J3Mgc2ltcGxlc3QpIHNlZW1zIGxpa2UgdGhlIG11Y2ggc2FmZXIgb3B0aW9uLiBNdWNoIGxl
c3MKPj4+Pj4gY29kZSB0aGF0IGNhbiBnbyB3cm9uZy4KPj4+Pj4gLURhbmllbAo+Pj4+Cj4+Pj4K
Pj4+PiBSZWdhcmRpbmcgQ09XLCBpIHdhcyBsb29raW5nIGludG8gaG93IHRvIHByb3Blcmx5IGlt
cGxlbWVudCBpdCBmcm9tCj4+Pj4gd2l0aGluIHRoZSBmYXVsdCBoYW5kbGVyIChpLmUuIHR0bV9i
b192bV9mYXVsdCkKPj4+PiBhbmQgdGhlIG1haW4gb2JzdGFjbGUgSSBoaXQgaXMgdGhhdCBvZiBl
eGNsdXNpdmUgYWNjZXNzIHRvIHRoZQo+Pj4+IHZtX2FyZWFfc3RydWN0LCBpIG5lZWQgdG8gYmUg
YWJsZSB0byBtb2RpZnkKPj4+PiB2bWEtPnZtX2ZsYWdzIChhbmQgdm1fcGFnZV9wcm90KSAgdG8g
cmVtb3ZlIFZNX1NIQVJFRCBiaXQgc28gQ09XIGNhbgo+Pj4+IGJlIHRyaWdnZXJlZCBvbiBzdWJz
ZXF1ZW50IHdyaXRlIGFjY2Vzcwo+Pj4+IGZhdWx0IChoZXJlCj4+Pj4gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9tbS9tZW1vcnkuYyNMNDEyOCkKPj4+PiBi
dXQgY29yZSBtbSB0YWtlcyBvbmx5IHJlYWQgc2lkZSBtbV9zZW0gKGhlcmUgZm9yIGV4YW1wbGUK
Pj4+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZl
cnMvaW9tbXUvYW1kL2lvbW11X3YyLmMjTDQ4OCkKPj4+PiBhbmQgc28gSSBhbSBub3Qgc3VwcG9z
ZWQgdG8gbW9kaWZ5IHZtX2FyZWFfc3RydWN0IGluIHRoaXMgY2FzZS4gSSBhbQo+Pj4+IG5vdCBz
dXJlIGlmIGl0J3MgbGVnaXQgdG8gd3JpdGUgbG9jayB0dGhlIG1tX3NlbSBmcm9tIHRoaXMgcG9p
bnQuCj4+Pj4gSSBmb3VuZCBzb21lIGRpc2N1c3Npb25zIGFib3V0IHRoaXMgaGVyZQo+Pj4+IGh0
dHA6Ly9sa21sLml1LmVkdS9oeXBlcm1haWwvbGludXgva2VybmVsLzE5MDkuMS8wMjc1NC5odG1s
IGJ1dCBpdAo+Pj4+IHdhc24ndCByZWFsbHkgY2xlYXIgdG8gbWUKPj4+PiB3aGF0J3MgdGhlIHNv
bHV0aW9uLgo+Pj4+Cj4+Pj4gSW4gYW55IGNhc2UsIHNlZW1zIHRvIG1lIHRoYXQgZWFzaWVyIGFu
ZCBtb3JlIG1lbW9yeSBzYXZpbmcgc29sdXRpb24KPj4+PiB3b3VsZCBiZSB0byBqdXN0IHN3aXRj
aCB0byBwZXIgdHRtIGJvIGR1bXkgcncgcGFnZSB0aGF0Cj4+Pj4gd291bGQgYmUgYWxsb2NhdGVk
IG9uIGRlbWFuZCBhcyB5b3Ugc3VnZ2VzdGVkIGhlcmUuICBUaGlzIHNob3VsZCBhbHNvCj4+Pj4g
dGFrZSBjYXJlIG9mIGltcG9ydGVkIEJPcyBhbmQgZmxpbmsgY2FzZXMuCj4+Pj4gVGhlbiBpIGNh
biBkcm9wIHRoZSBwZXIgZGV2aWNlIEZEIGFuZCBwZXIgR0VNIG9iamVjdCBGRCBkdW1teSBCTyBh
bmQKPj4+PiB0aGUgdWdseSBsb29wIGkgYW0gdXNpbmcgaW4gcGF0Y2ggMiB0byBtYXRjaCBmYXVs
dGluZyBCTyB0byB0aGUgcmlnaHQKPj4+PiBkdW1teSBwYWdlLgo+Pj4+Cj4+Pj4gRG9lcyB0aGlz
IG1ha2VzIHNlbnNlID8KPj4+Cj4+PiBJIHN0aWxsIGRvbid0IHNlZSB0aGUgaW5mb3JtYXRpb24g
bGVhayBhcyBtdWNoIG9mIGEgcHJvYmxlbSwgYnV0IGlmCj4+PiBEYW5pZWwgaW5zaXN0cyB3ZSBz
aG91bGQgcHJvYmFibHkgZG8gdGhpcy4KPj4KPj4gV2VsbCBhbWRncHUgZG9lc24ndCBjbGVhciBi
dWZmZXJzIGJ5IGRlZmF1bHQsIHNvIGluZGVlZCB5b3UgZ3V5cyBhcmUgYQo+PiBsb3QgbW9yZSBs
YWlzc2V6LWZhaXJlIGhlcmUuIEJ1dCBpbiBnZW5lcmFsIHdlIHJlYWxseSBkb24ndCBkbyB0aGF0
Cj4+IGtpbmQgb2YgbGVha2luZy4gSWlyYyB0aGVyZSdzIGV2ZW4gcmFkZW9uc2kgYnVncyBiZWNh
dXNlIGVsc2UgY2xlYXJzLAo+PiBhbmQgcmFkZW9uc2kgaGFwcGlseSBkaXNwbGF5cyBndW5rIDot
KQo+IAo+IGJ0dyBJIHRoaW5rIG5vdCBjbGVhcmluZyBhdCBhbGxvYyBicmVha3MgdGhlIHJlbmRl
ciBub2RlIG1vZGVsIGEgYml0Lgo+IFdpdGhvdXQgdGhhdCB0aGlzIHdhcyBhbGwgZmluZSwgc2lu
Y2Ugc3lzdGVtIHBhZ2VzIHN0aWxsIGdvdCBjbGVhcmVkCj4gYnkgYWxsb2NfcGFnZSgpLCBhbmQg
d2Ugb25seSBsZWFrZWQgdnJhbS4gQW5kIGZvciB0aGUgbGVnYWN5IG5vZGUKPiBtb2RlbCB3aXRo
IGF1dGhlbnRpY2F0aW9uIG9mIGNsaWVudHMgYWdhaW5zdCB0aGUgWCBzZXJ2ZXIsIGxlYWtpbmcK
PiB0aGF0IGFsbCBhcm91bmQgd2FzIG9rLiBXaXRoIHJlbmRlciBub2RlcyBubyBsZWFraW5nIHNo
b3VsZCBoYXBwZW4sCj4gd2l0aCBubyBrbm9iIGZvciB1c2Vyc3BhY2UgdG8gb3B0IG91dCBvZiB0
aGUgZm9yY2VkIGNsZWFyaW5nLgoKU2Vjb25kZWQuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOk
bnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGli
cmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5k
IFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
