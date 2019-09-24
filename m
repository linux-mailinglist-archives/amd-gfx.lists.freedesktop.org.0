Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F62CBC297
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 09:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5396E9B6;
	Tue, 24 Sep 2019 07:27:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933776E9B6
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 07:27:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zlx5/kO7bT12chTM/E8/yQB4ONRcCVPvx2oQjMcuUSCVaVq5acuUhvuxg/hdmxhPYCES8vpfKz/1xp/2/BSjoO9uIEaU1YjQICBBQdLuksY2oUtCh+FolzeSCmYwoWOMUNeDP+WNf0gAR+yIiWSWf6cMznRACPX035Nc5thmpEhkP8Z9FQGz7jxdKz+x4hklHMVdCLiNGZrTLzxafDvj8xSHT1OtDzuYbA5joV9Zkmc/L38+3D7AHt+E5InCVJWqGwESiXItGGJoWdIIjWHtMnFaYqirpV7w/eOd8nKxsumUQs2nDCKlqe3/Z8sFOhDJVq0me8zscC135d4FJlvkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6BT5Ga5VBqP+mFFJ2cjn+qU5b9bMYN2d3OA3gG6G2M=;
 b=kxlnF7plIVX30RMyfqwYDxzar4NZqj8VG4cWCezBzT/tIJpkZ/0AFpvhHdreLNG2YIgVOm2PzrKGBYHXjcCG0DgV+aUcgr6eE/JvWjr0sgYfhvfSm/Z2JyOJdgyXFlTDQlMrmDoooNsKAaFQmakGwrBpbhj0lySvlQ+uDZCYQBeAzDBsFmm6bF7L3ZozyTIbgvbjE70D+Kx91367KOaU6w+CRR6Ga58+oROc0LlJ8BZC1rzADY1s4VyeY0eprRh3fnZcYQky3SzMsVg/Rigfesanpimnz3UNNeZptk3huikuJUr+OxvMlZvilIu36wFXmkR8R5NXNOZ6ymfh9isgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3103.namprd12.prod.outlook.com (20.178.241.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 07:27:41 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:27:41 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi12
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi12
Thread-Index: AQHVcoRJ/hPL7jNvCkCPVhA00il2HKc6J2VQgABCiv+AAAPIsA==
Date: Tue, 24 Sep 2019 07:27:41 +0000
Message-ID: <MN2PR12MB33449324035BB7BC3E363E29E4840@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190924030042.5545-1-xiaojie.yuan@amd.com>,
 <BN8PR12MB3329DDCAF8D6276EFDB2AA9AE4840@BN8PR12MB3329.namprd12.prod.outlook.com>
 <BN8PR12MB3602DD5B7EC8F117B559C50489840@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3602DD5B7EC8F117B559C50489840@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb77aed8-8b90-449d-9b17-08d740c0af86
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3103; 
x-ms-traffictypediagnostic: MN2PR12MB3103:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31030B82399BB864A215516CE4840@MN2PR12MB3103.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(13464003)(199004)(189003)(7696005)(2501003)(81166006)(81156014)(8936002)(53546011)(8676002)(6506007)(478600001)(102836004)(99286004)(74316002)(2906002)(305945005)(3846002)(7736002)(76176011)(256004)(14454004)(6116002)(5660300002)(25786009)(14444005)(229853002)(66556008)(64756008)(52536014)(86362001)(66476007)(11346002)(6246003)(71190400001)(71200400001)(446003)(486006)(476003)(66446008)(6436002)(110136005)(33656002)(4326008)(76116006)(66946007)(9686003)(55016002)(186003)(66066001)(26005)(316002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3103;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RQyFe5cDkQtVxOINtdmNnE+y/hN3e37KRBTCFGxvHMMrL49m3TFUNt6MKbB8avwXQOImCBHosyhVTEM/qX9l3GV/3u03VUopSGZY6TRJdOWpo1Q3770BpjNv5Vafud3N5psRgXf8mF9uxIZayVPnXefeDkLtasat7+lZtRMEf3YP+pMqk7MI/3suxg3aA4ORjVxxHZsfVNubLr9aPEfidBYJOFxXCXnBDo0fyddgOeavHHbXHZW7IWYpT/izxQNaEQiT4gXLtbT5K4U+G5BgtcxUJAJ5jgQtXvqMMN0yzjKAESSHdMR+IzjX6WHlywj5QF5RimYPxCxUs5VquMd3hRMWcfvowMMwVVcSs4rjWlxTFZR2zwYMQ4RcMWy0jETTZTyXDexRKOJtYwi64VisV/aXIMuawnsjS32O9ckxBQM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb77aed8-8b90-449d-9b17-08d740c0af86
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:27:41.7847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i827oq56c1UcfCGqz/ndV+Y6fArDjKR+qVxCEKgy5uhGmLLuNGmsXhb+zoz2THpl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6BT5Ga5VBqP+mFFJ2cjn+qU5b9bMYN2d3OA3gG6G2M=;
 b=I/88Bi4g5f7joWtOH6XsSMvUUT9pizBG1dEpt7uIFFFWsz/Ccso39mcn8FiG4ukz2HEcTk7nNSO6Jw5dh4jp1wDY2EhTdGPwexJX+ptH9cDd9bMYSUiTQP8LKbiE8PG2rvqliY7unLtZAyRREYt6BfwP9Tv9KAGVk+bei8gcAYo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U3VyZS4gRnJlZSB0byBhZGQgbXkgUkIgd2l0aCB0aGF0LgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0KRnJvbTogWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+IApTZW50OiBU
dWVzZGF5LCBTZXB0ZW1iZXIgMjQsIDIwMTkgMzoyMCBQTQpUbzogUXVhbiwgRXZhbiA8RXZhbi5R
dWFuQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFhpYW8sIEphY2sgPEphY2suWGlhb0BhbWQu
Y29tPjsgWWluLCBUaWFuY2kgKFJpY28pIDxUaWFuY2kuWWluQGFtZC5jb20+ClN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybS9hbWRncHUvZ21jMTA6IGFwcGx5IHRoZSAnaW52YWxpZGF0aW9uIGZyb20g
c2RtYScgd29ya2Fyb3VuZCBmb3IgbmF2aTEyCgpUaGFua3MgRXZhbi4gU2luY2Ugd2UgY3VycmVu
dGx5IGhhcyBvbmx5IG9uY2UgcGxhY2UgdG8gY2hlY2sgJ2lzIG5hdmkgc2VyaWVzJywgSSdkIHBy
ZWZlciBub3QgdG8gcHV0IGludG8gYSBtYWNybyB1bnRpbCB3ZSBoYXZlIGFub3RoZXIgcGxhY2Ug
dG8gY2hlY2sgdGhhdC4gRG9lcyB0aGUgY2hhbmdlIGJlbG93IGxvb2tzIGdvb2QgdG8geW91PwoK
LSAgICAgICAgICAgYWRldi0+YXNpY190eXBlID4gQ0hJUF9OQVZJMTQgfHwKKyAgICAgICAgICAg
IShhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9OQVZJMTAgJiYgYWRldi0+YXNpY190eXBlIDw9IENI
SVBfTkFWSTEyKSB8fAoKQlIsClhpYW9qaWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJvbTogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+ClNlbnQ6IFR1
ZXNkYXksIFNlcHRlbWJlciAyNCwgMjAxOSAxMToxOCBBTQpUbzogWXVhbiwgWGlhb2ppZTsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IFpoYW5nLCBIYXdraW5nOyBYaWFvLCBKYWNr
OyBZaW4sIFRpYW5jaSAoUmljbykKU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdS9nbWMx
MDogYXBwbHkgdGhlICdpbnZhbGlkYXRpb24gZnJvbSBzZG1hJyB3b3JrYXJvdW5kIGZvciBuYXZp
MTIKCkEgc21hbGwgbml0cGljazogaWYgdGhpcyB3b3JrYXJvdW5kIGlzIG5lZWRlZCBmb3IgYWxs
IE5BVmkgQVNJQ3MsIGNhbiB3ZSBtYWtlIGEgbWFjcm8gZm9yIHRoaXM/CmUuZy4gICNkZWZpbmUg
QVNJQ19JU19OQVZJX1NFUklFUyhhZGV2KSAgICAgICAgICAgICAgIChhZGV2LT5hc2ljX3R5cGUg
Pj0gQ0hJUF9OQVZJMTAgJiYgYWRldi0+YXNpY190eXBlIDw9IE5BVkkxMikKClRoZW4gd2UgY2Fu
IHVzZQogICAgICAgIGlmICghYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxlZCB8fAogICAg
ICAgICAgICAhYWRldi0+aWJfcG9vbF9yZWFkeSB8fAotICAgICAgICAgICBhZGV2LT5hc2ljX3R5
cGUgPiBDSElQX05BVkkxNCB8fAorICAgICAgICAgICAhQVNJQ19JU19OQVZJX1NFUklFUyhhZGV2
KSB8fAogICAgICAgICAgICBhZGV2LT5pbl9ncHVfcmVzZXQpIHsKCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCkZyb206IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQuY29tPgpTZW50
OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjQsIDIwMTkgMTE6MDEgQU0KVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBZaW4sIFRpYW5jaSAoUmljbykgPFRp
YW5jaS5ZaW5AYW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgWXVhbiwg
WGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+ClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdw
dS9nbWMxMDogYXBwbHkgdGhlICdpbnZhbGlkYXRpb24gZnJvbSBzZG1hJyB3b3JrYXJvdW5kIGZv
ciBuYXZpMTIKCndoZW4gZ2Z4b2ZmIGlzIGVuYWJsZWQsIHNkbWEgaGFuZ3Mgd2hpbGUgZW50ZXJp
bmcgZGVza3RvcCB3aXRob3V0IHRoaXMgd29ya2Fyb3VuZAoKU2lnbmVkLW9mZi1ieTogWGlhb2pp
ZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjEwXzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKaW5kZXgg
ZWQxYzNiODgzZjZhLi4wMzA0Y2E4ZmU3MjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192MTBfMC5jCkBAIC0yOTEsNyArMjkxLDcgQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2ZsdXNo
X2dwdV90bGIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCgogICAg
ICAgIGlmICghYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxlZCB8fAogICAgICAgICAgICAh
YWRldi0+aWJfcG9vbF9yZWFkeSB8fAotICAgICAgICAgICBhZGV2LT5hc2ljX3R5cGUgPiBDSElQ
X05BVkkxNCB8fAorICAgICAgICAgICBhZGV2LT5hc2ljX3R5cGUgPiBDSElQX05BVkkxMiB8fAog
ICAgICAgICAgICBhZGV2LT5pbl9ncHVfcmVzZXQpIHsKICAgICAgICAgICAgICAgIGdtY192MTBf
MF9mbHVzaF92bV9odWIoYWRldiwgdm1pZCwgQU1ER1BVX0dGWEhVQl8wLCAwKTsKICAgICAgICAg
ICAgICAgIG11dGV4X3VubG9jaygmYWRldi0+bW1hbi5ndHRfd2luZG93X2xvY2spOwotLQoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
