Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93451A44
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 20:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E856E89D9B;
	Mon, 24 Jun 2019 18:06:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710089.outbound.protection.outlook.com [40.107.71.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2689D9B
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 18:06:38 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1540.namprd12.prod.outlook.com (10.172.17.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 18:06:36 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332%7]) with mapi id 15.20.2008.017; Mon, 24 Jun 2019
 18:06:36 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [bug report] drm/amdkfd: Add procfs-style information for KFD
 processes
Thread-Topic: [bug report] drm/amdkfd: Add procfs-style information for KFD
 processes
Thread-Index: AQHVKogVygxRaHp0n0aBod0io3/lQaarGLrQ
Date: Mon, 24 Jun 2019 18:06:36 +0000
Message-ID: <BN6PR12MB16181F76E1F385E999A2219585E00@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190624122630.GA30487@mwanda>
In-Reply-To: <20190624122630.GA30487@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1ca0:3f2:9d6f:eb5c:5991:9000]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 697ec27a-68c4-4415-f0f7-08d6f8ceb2ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1540; 
x-ms-traffictypediagnostic: BN6PR12MB1540:
x-microsoft-antispam-prvs: <BN6PR12MB154012A3A42CF0F10DE7F5DE85E00@BN6PR12MB1540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(13464003)(73956011)(6116002)(8676002)(72206003)(33656002)(46003)(81156014)(486006)(11346002)(446003)(14444005)(6916009)(81166006)(256004)(14454004)(9686003)(8936002)(476003)(6436002)(229853002)(55016002)(6246003)(53936002)(99286004)(186003)(316002)(102836004)(71200400001)(76176011)(68736007)(53546011)(71190400001)(7696005)(6506007)(478600001)(5660300002)(74316002)(2906002)(305945005)(7736002)(66946007)(66446008)(76116006)(66556008)(4326008)(66476007)(64756008)(25786009)(52536014)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1540;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RvcYjdf7HrvCGF0ZFv+Fm73kUkI7m0un8BiiBi96Yl/D1ZIUlA+YQfPY4qHORVI4Ofr65DeyVDPmMNK5OS1ogspkCevxcYLAIjE7oFIZKE41jjboNcFbUJQ4m4AqAnPRtxVRCykd5JxDdjwuHrSsKSJ+LqH1tU03FgB4qUvx1VY3zXlVqABGjUhawmRx9wfMzywxj0r/TMn/rlF7Si4yFr1MsxfasA0X6K1n3IFeClSXEAnfKh2HOCW8XJbmUYagvDfUPNDeaNYRwE9/m7GIRCu+PZbbNoY1zuZQPSRqRUDI+UtNSLcsiezrc3+oe6J32fH/YA6DgOsXjRMWiQotiTGWtKyeYtRni6yXdGawffIe4VxhNO9nMbhXnmKgbxkZs8CiLV1Kiz8C8IHSegvqS7+/gXF+/1y9EzZYEgbhpa0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697ec27a-68c4-4415-f0f7-08d6f8ceb2ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 18:06:36.6772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdm+xqW6JvxkdvAiv4MJAn4QcIV0gmP4VMrw17XbEXA=;
 b=aeQhDyJRAJ/Mgx3O37hto0aCgbP3ICaxrrLL3htkt6tTV6AaOkesqyTGuRWYfROWkZANxwwh/4xL9z2XIhQR+5GTzZHdQudDWtbvu7BRYmEkJYNRYBB3QtYsIJATyvCIecp4bNK8TM2B29Sc/OTI5chKqXhadEUWNYa3PZ8xMSk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SEkgRGFuLAoKSSdsbCBjb21tZW50IGlubGluZSB3aXRoIFtLUl0gZm9yIHRoZSBtb3N0IHBhcnQu
CgpNb3N0IG9mIHRoZXNlIGNvbWUgZnJvbSB0aGUgZmFjdCB0aGF0ICJmYWlsdXJlIiBoZXJlIGlz
IG5vdCBjcml0aWNhbC4gSWYgd2UgY2FuJ3QgbWFrZSB0aGUgcHJvY2ZzLCB3ZSBqdXN0IGNvbW1l
bnQgYWJvdXQgaXQgaW4gZG1lc2cgYW5kIGNhcnJ5IG9uLiBJZiB3ZSBmYWlsIHRvIG1ha2UgdGhl
IHByb2NmcyBzdHJ1Y3R1cmUgaGVyZSwgd2UganVzdCByZXBvcnQgYW5kIGNhcnJ5IG9uLiBUaGUg
cmVzdCBvZiB0aGUga2VybmVsIGNhbiBmdW5jdGlvbiB3aXRob3V0IGl0LCBzbyBmYWlsdXJlIGlz
bid0IGNyaXRpY2FsLiBCdXQgSSBzaG91bGQgbWFrZSB0aGlzIGNsZWFyIGluIHRoZSBjb21tZW50
cy4gVGhlcmUgaXMgbm8gcmVhbCBlcnJvciBoYW5kbGluZyByZXF1aXJlZCwgYnV0IHdlIGNhbiBj
bGFyaWZ5IHRoYXQgd2l0aCBjb21tZW50cy4gSSdsbCB0cnkgdG8gYWRkcmVzcyB0aGlzIGluIGEg
Y29taW5nIHBhdGNoLgoKIEtlbnQKCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IERh
biBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4gClNlbnQ6IE1vbmRheSwgSnVu
ZSAyNCwgMjAxOSA4OjI3IEFNClRvOiBSdXNzZWxsLCBLZW50IDxLZW50LlJ1c3NlbGxAYW1kLmNv
bT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClN1YmplY3Q6IFtidWcgcmVwb3J0
XSBkcm0vYW1ka2ZkOiBBZGQgcHJvY2ZzLXN0eWxlIGluZm9ybWF0aW9uIGZvciBLRkQgcHJvY2Vz
c2VzCgpIZWxsbyBLZW50IFJ1c3NlbGwsCgpUaGUgcGF0Y2ggZGU5ZjI2YmJkMzg0OiAiZHJtL2Ft
ZGtmZDogQWRkIHByb2Nmcy1zdHlsZSBpbmZvcm1hdGlvbiBmb3IgS0ZEIHByb2Nlc3NlcyIgZnJv
bSBKdW4gMTMsIDIwMTksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljIGNoZWNrZXIgd2Fy
bmluZzoKCglkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2ZkX3Byb2Nlc3Mu
YzoyOTcga2ZkX2NyZWF0ZV9wcm9jZXNzKCkKCWVycm9yOiAncHJvY2VzcycgZGVyZWZlcmVuY2lu
ZyBwb3NzaWJsZSBFUlJfUFRSKCkKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGtm
ZC9rZmRfcHJvY2Vzcy5jCiAgIDI4NCAgICAgICAgICAgKi8KICAgMjg1ICAgICAgICAgIG11dGV4
X2xvY2soJmtmZF9wcm9jZXNzZXNfbXV0ZXgpOwogICAyODYgIAogICAyODcgICAgICAgICAgLyog
QSBwcmlvciBvcGVuIG9mIC9kZXYva2ZkIGNvdWxkIGhhdmUgYWxyZWFkeSBjcmVhdGVkIHRoZSBw
cm9jZXNzLiAqLwogICAyODggICAgICAgICAgcHJvY2VzcyA9IGZpbmRfcHJvY2Vzcyh0aHJlYWQp
OwogICAyODkgICAgICAgICAgaWYgKHByb2Nlc3MpIHsKICAgMjkwICAgICAgICAgICAgICAgICAg
cHJfZGVidWcoIlByb2Nlc3MgYWxyZWFkeSBmb3VuZFxuIik7CiAgIDI5MSAgICAgICAgICB9IGVs
c2UgewogICAyOTIgICAgICAgICAgICAgICAgICBwcm9jZXNzID0gY3JlYXRlX3Byb2Nlc3ModGhy
ZWFkLCBmaWxlcCk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eIFRoaXMgcmV0dXJucyBlcnJvciBwb2ludGVycy4KW0tSXSBUaGlz
IHdhcyB0aGUgb3JpZ2luYWwgY29kZS4gTm90IHNheWluZyBpdCdzIHJpZ2h0IHRob3VnaCwgSSds
bCBzZWUgaWYgd2UgY2FuIGFkZHJlc3MgaXQuCiAgIDI5MyAgCiAgIDI5NCAgICAgICAgICAgICAg
ICAgIGlmICghcHJvY2ZzLmtvYmopCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5e
Xl5eXl4gVGhpcyBpcyBhIGdsb2JhbC4gIENhbiB3ZSBjaGVjayBpdCBlYXJsaWVyPwpbS1JdIFRo
ZSBiaWcgdGhpbmcgZm9yIHRoaXMgaXMgdGhhdCBpZiB0aGUga29iaiBkb2Vzbid0IGV4aXN0LCB3
ZSBjYW4gc2tpcCB0aGUgcmVzdC4gV2UndmUgYmFzaWNhbGx5IGdvdCAyIHRoaW5ncyBoZXJlIGFu
ZCBJIGNvbWJpbmVkIHRoZW0gaW50byAxLCBnZXR0aW5nIHRoZSBwcm9jZXNzIGFuZCBtYWtpbmcg
dGhlIHByb2NmcyBlbnRyeS4gSSBzaG91bGQgbWFrZSBjb21tZW50cyB0byBjbGFyaWZ5LgoKICAg
Mjk1ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgMjk2ICAKICAgMjk3ICAg
ICAgICAgICAgICAgICAgcHJvY2Vzcy0+a29iaiA9IGtmZF9hbGxvY19zdHJ1Y3QocHJvY2Vzcy0+
a29iaik7CiAgIDI5OCAgICAgICAgICAgICAgICAgIGlmICghcHJvY2Vzcy0+a29iaikgewogICAy
OTkgICAgICAgICAgICAgICAgICAgICAgICAgIHByX3dhcm4oIkNyZWF0aW5nIHByb2NmcyBrb2Jq
ZWN0IGZhaWxlZCIpOwogICAzMDAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OwoK
V2UgcmV0dXJuIHN1Y2Nlc3Mgb24gdGhpcyBwYXRoLgogICAzMDEgICAgICAgICAgICAgICAgICB9
CiAgIDMwMiAgICAgICAgICAgICAgICAgIHJldCA9IGtvYmplY3RfaW5pdF9hbmRfYWRkKHByb2Nl
c3MtPmtvYmosICZwcm9jZnNfdHlwZSwKICAgMzAzICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcHJvY2ZzLmtvYmosICIlZCIsCiAgIDMwNCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpbnQpcHJvY2Vzcy0+bGVhZF90aHJlYWQt
PnBpZCk7CiAgIDMwNSAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKICAgMzA2ICAgICAgICAg
ICAgICAgICAgICAgICAgICBwcl93YXJuKCJDcmVhdGluZyBwcm9jZnMgcGlkIGRpcmVjdG9yeSBm
YWlsZWQiKTsKICAgMzA3ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKCk5vIGVy
cm9yIGhhbmRsaW5nLiAgQmFzaWNhbGx5IHdoZW5ldmVyIHRoZXJlIGlzIGEgZ290byBvdXQgdGhl
IGVycm9yIGhhbmRsaW5nIGlzIHN1c3BlY3QuICBJdCdzIGJldHRlciB0byBwaWNrIGEgbmFtZSB3
aGljaCBzYXlzIHdoYXQgdGhlIGVycm9yIGxhYmVsIGRvZXMuLi4KICAgMzA4ICAgICAgICAgICAg
ICAgICAgfQogICAzMDkgIAogICAzMTAgICAgICAgICAgICAgICAgICBwcm9jZXNzLT5hdHRyX3Bh
c2lkLm5hbWUgPSAicGFzaWQiOwogICAzMTEgICAgICAgICAgICAgICAgICBwcm9jZXNzLT5hdHRy
X3Bhc2lkLm1vZGUgPSBLRkRfU1lTRlNfRklMRV9NT0RFOwogICAzMTIgICAgICAgICAgICAgICAg
ICBzeXNmc19hdHRyX2luaXQoJnByb2Nlc3MtPmF0dHJfcGFzaWQpOwogICAzMTMgICAgICAgICAg
ICAgICAgICByZXQgPSBzeXNmc19jcmVhdGVfZmlsZShwcm9jZXNzLT5rb2JqLCAmcHJvY2Vzcy0+
YXR0cl9wYXNpZCk7CiAgIDMxNCAgICAgICAgICAgICAgICAgIGlmIChyZXQpCiAgIDMxNSAgICAg
ICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiQ3JlYXRpbmcgcGFzaWQgZm9yIHBpZCAlZCBm
YWlsZWQiLAogICAzMTYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
aW50KXByb2Nlc3MtPmxlYWRfdGhyZWFkLT5waWQpOwoKRXJyb3IgaGFuZGxpbmcgYW5kIGVycm9y
IGNvZGUgbWlzc2luZy4KCiAgIDMxNyAgICAgICAgICB9CiAgIDMxOCAgb3V0OgogICAzMTkgICAg
ICAgICAgbXV0ZXhfdW5sb2NrKCZrZmRfcHJvY2Vzc2VzX211dGV4KTsKICAgMzIwICAKICAgMzIx
ICAgICAgICAgIHJldHVybiBwcm9jZXNzOwogICAzMjIgIH0KCgpyZWdhcmRzLApkYW4gY2FycGVu
dGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
