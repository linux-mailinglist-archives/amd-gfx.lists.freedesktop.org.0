Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354772128B6
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Jul 2020 17:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF156EB1A;
	Thu,  2 Jul 2020 15:54:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 414836EA93
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Jul 2020 08:35:55 +0000 (UTC)
Received: from [10.130.0.52] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxXetknP1eFWVOAA--.8S3;
 Thu, 02 Jul 2020 16:35:50 +0800 (CST)
Subject: Re: [PATCH v2] gpu/drm: Remove debug info about CPU address
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com
References: <1593656863-1894-1-git-send-email-yangtiezhu@loongson.cn>
 <85c81fa9-2994-d861-0690-a79600ed84b3@amd.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <af4f9870-3161-87f7-ff4f-1c0ad7869717@loongson.cn>
Date: Thu, 2 Jul 2020 16:35:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <85c81fa9-2994-d861-0690-a79600ed84b3@amd.com>
X-CM-TRANSID: AQAAf9DxXetknP1eFWVOAA--.8S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCw43Wr1DAryfZw48Gw1kuFg_yoW5uF4xpF
 WrGa4Ykr95Zw1j9347AFyUZFyFyw4xWay8Kr1DC34a9w15ZF10kr13Aw47XFWkXrs3tr4I
 qr1ku3y8W3WjkrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
 WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
 I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
 4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4NtxUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Mailman-Approved-At: Thu, 02 Jul 2020 15:54:18 +0000
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMDcvMDIvMjAyMCAwNDoyNyBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAwMi4w
Ny4yMCB1bSAwNDoyNyBzY2hyaWViIFRpZXpodSBZYW5nOgo+PiBXaGVuIEkgdXBkYXRlIHRoZSBs
YXRlc3Qga2VybmVsLCBJIHNlZSB0aGUgZm9sbG93aW5nICJfX19fcHRydmFsX19fXyIgCj4+IGJv
b3QKPj4gbWVzc2FnZXMuCj4+Cj4+IFsgICAgMS44NzI2MDBdIHJhZGVvbiAwMDAwOjAxOjA1LjA6
IGZlbmNlIGRyaXZlciBvbiByaW5nIDAgdXNlIGdwdSAKPj4gYWRkciAweDAwMDAwMDAwNDgwMDBj
MDAgYW5kIGNwdSBhZGRyIDB4KF9fX19wdHJ2YWxfX19fKQo+PiBbICAgIDEuODc5MDk1XSByYWRl
b24gMDAwMDowMTowNS4wOiBmZW5jZSBkcml2ZXIgb24gcmluZyA1IHVzZSBncHUgCj4+IGFkZHIg
MHgwMDAwMDAwMDQwMDU2MDM4IGFuZCBjcHUgYWRkciAweChfX19fcHRydmFsX19fXykKPj4KPj4g
Qm90aCByYWRlb25fZmVuY2VfZHJpdmVyX3N0YXJ0X3JpbmcoKSBhbmQgCj4+IGFtZGdwdV9mZW5j
ZV9kcml2ZXJfc3RhcnRfcmluZygpCj4+IGhhdmUgdGhlIHNpbWlsYXIgaXNzdWUsIHRoZXJlIGV4
aXN0cyB0aGUgZm9sbG93aW5nIHR3byBtZXRob2RzIHRvIAo+PiBzb2x2ZSBpdDoKPj4gKDEpIFVz
ZSAiJXBLIiBpbnN0ZWFkIG9mICIlcCIgc28gdGhhdCB0aGUgQ1BVIGFkZHJlc3MgY2FuIGJlIHBy
aW50ZWQgCj4+IHdoZW4KPj4gdGhlIGtwdHJfcmVzdHJpY3Qgc3lzY3RsIGlzIHNldCB0byAxLgo+
PiAoMikgSnVzdCBjb21wbGV0ZWx5IGRyb3AgdGhlIENQVSBhZGRyZXNzIHN1Z2dlc3RlZCBieSBD
aHJpc3RpYW4sIGJlY2F1c2UKPj4gdGhlIENQVSBhZGRyZXNzIHdhcyB1c2VmdWwgaW4gdGhlIHBh
c3QsIGJ1dCBpc24ndCBhbnkgbW9yZS4gV2Ugbm93IAo+PiBoYXZlIGEKPj4gZGVidWdmcyBmaWxl
IHRvIHJlYWQgdGhlIGN1cnJlbnQgZmVuY2UgdmFsdWVzLgo+Pgo+PiBTaW5jZSB0aGUgQ1BVIGFk
ZHJlc3MgaXMgbm90IG11Y2ggdXNlZnVsLCBqdXN0IHJlbW92ZSB0aGUgZGVidWcgaW5mbyAKPj4g
YWJvdXQKPj4gQ1BVIGFkZHJlc3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRpZXpodSBZYW5nIDx5
YW5ndGllemh1QGxvb25nc29uLmNuPgo+Cj4gU3BsaXR0aW5nIGl0IGludG8gb25lIHBhdGNoIGZv
ciByYWRlb24gYW5kIG9uZSBmb3IgYW1kZ3B1IG1pZ2h0IGJlIAo+IG5pY2UgdG8gaGF2ZS4KClNo
b3VsZCBJIHNwbGl0IHRoaXMgcGF0Y2ggaW50byB0d28gcGF0Y2hlcyBhbmQgdGhlbiBzZW5kIHYz
PwpJZiB5ZXMsIEkgd2lsbCBkbyBpdCBzb29uLgoKPgo+IEJ1dCBlaXRoZXIgd2F5IFJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IAo+IGZvciB0
aGUgcGF0Y2guCj4KPiBUaGFua3MsCj4gQ2hyaXN0aWFuLgo+Cj4+IC0tLQo+Pgo+PiB2MjoKPj4g
ICAgLSBKdXN0IHJlbW92ZSB0aGUgZGVidWcgaW5mbyBhYm91dCBDUFUgYWRkcmVzcyBzdWdnZXN0
ZWQgYnkgQ2hyaXN0aWFuCj4+ICAgIC0gTW9kaWZ5IHRoZSBwYXRjaCBzdWJqZWN0IGFuZCB1cGRh
dGUgdGhlIGNvbW1pdCBtZXNzYWdlCj4+Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2ZlbmNlLmMgfCA1ICsrLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZmVuY2UuYyAgICAgfCA0ICsrLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9mZW5jZS5jCj4+IGluZGV4IGQ4NzhmZTcuLmEyOWYyZjkgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCj4+IEBAIC00MjIsOSArNDIyLDgg
QEAgaW50IGFtZGdwdV9mZW5jZV9kcml2ZXJfc3RhcnRfcmluZyhzdHJ1Y3QgCj4+IGFtZGdwdV9y
aW5nICpyaW5nLAo+PiAgICAgICByaW5nLT5mZW5jZV9kcnYuaXJxX3R5cGUgPSBpcnFfdHlwZTsK
Pj4gICAgICAgcmluZy0+ZmVuY2VfZHJ2LmluaXRpYWxpemVkID0gdHJ1ZTsKPj4gICAtICAgIERS
TV9ERVZfREVCVUcoYWRldi0+ZGV2LCAiZmVuY2UgZHJpdmVyIG9uIHJpbmcgJXMgdXNlIGdwdSBh
ZGRyICIKPj4gLSAgICAgICAgICAgICAgIjB4JTAxNmxseCwgY3B1IGFkZHIgMHglcFxuIiwgcmlu
Zy0+bmFtZSwKPj4gLSAgICAgICAgICAgICAgcmluZy0+ZmVuY2VfZHJ2LmdwdV9hZGRyLCByaW5n
LT5mZW5jZV9kcnYuY3B1X2FkZHIpOwo+PiArICAgIERSTV9ERVZfREVCVUcoYWRldi0+ZGV2LCAi
ZmVuY2UgZHJpdmVyIG9uIHJpbmcgJXMgdXNlIGdwdSBhZGRyIAo+PiAweCUwMTZsbHhcbiIsCj4+
ICsgICAgICAgICAgICAgIHJpbmctPm5hbWUsIHJpbmctPmZlbmNlX2Rydi5ncHVfYWRkcik7Cj4+
ICAgICAgIHJldHVybiAwOwo+PiAgIH0KPj4gICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZmVuY2UuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9mZW5jZS5jCj4+IGluZGV4IDQzZjJmOTMuLjg3MzViZjIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZlbmNlLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZmVuY2UuYwo+PiBAQCAtODY1LDggKzg2NSw4IEBAIGludCByYWRlb25f
ZmVuY2VfZHJpdmVyX3N0YXJ0X3Jpbmcoc3RydWN0IAo+PiByYWRlb25fZGV2aWNlICpyZGV2LCBp
bnQgcmluZykKPj4gICAgICAgfQo+PiAgICAgICByYWRlb25fZmVuY2Vfd3JpdGUocmRldiwgCj4+
IGF0b21pYzY0X3JlYWQoJnJkZXYtPmZlbmNlX2RydltyaW5nXS5sYXN0X3NlcSksIHJpbmcpOwo+
PiAgICAgICByZGV2LT5mZW5jZV9kcnZbcmluZ10uaW5pdGlhbGl6ZWQgPSB0cnVlOwo+PiAtICAg
IGRldl9pbmZvKHJkZXYtPmRldiwgImZlbmNlIGRyaXZlciBvbiByaW5nICVkIHVzZSBncHUgYWRk
ciAKPj4gMHglMDE2bGx4IGFuZCBjcHUgYWRkciAweCVwXG4iLAo+PiAtICAgICAgICAgcmluZywg
cmRldi0+ZmVuY2VfZHJ2W3JpbmddLmdwdV9hZGRyLCAKPj4gcmRldi0+ZmVuY2VfZHJ2W3Jpbmdd
LmNwdV9hZGRyKTsKPj4gKyAgICBkZXZfaW5mbyhyZGV2LT5kZXYsICJmZW5jZSBkcml2ZXIgb24g
cmluZyAlZCB1c2UgZ3B1IGFkZHIgCj4+IDB4JTAxNmxseFxuIiwKPj4gKyAgICAgICAgIHJpbmcs
IHJkZXYtPmZlbmNlX2RydltyaW5nXS5ncHVfYWRkcik7Cj4+ICAgICAgIHJldHVybiAwOwo+PiAg
IH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
