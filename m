Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E638702E
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 05:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284AA6ECED;
	Fri,  9 Aug 2019 03:30:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780044.outbound.protection.outlook.com [40.107.78.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720916ECED
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 03:30:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZt0CC55KlhEpvSIS/peLnVFM1QmAouGLVbCHzQbIMFlgEnAMDHEmDWwRLnYcbLG045kA6kvyP0HcbHJjb9zWI2McOCSb/bPeEvVBR9sG7CvJfcdws0Waa1wGe4QwJ+13X8vqiQf9IR4eDIadkLdLRjoKVtXnCMCfq8+RL8m1KZNGwZGe5ZfIGz/18XWWlgyT49ofq7iguvD3gsRdgQN7lzYGTYQIHlcDaVlgkuucItRldtfmypSuFlw0vAeVsXv6eI9LbnxIz5erh6EwTEL5aqqcoT0udzPfgqQmMHmUYBLS0/EhwHpNijBN33L2Gh+YBnGvj6ft+Z3Hyj2mxIeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxJrWf3LRZuH/R7Bu+0WUI+i/ZHP7SLg0lqI3xDcq9s=;
 b=ZMJY3U4XRBTCT6Ts2Wh2G55q7f1/S5KacZMrwJRrkZZ0yzVkQeq5KMDRZudlIwn/dpZZefv8ySHu18MlUuECYBcVA+jE2agxbU5PUgqbDKL13SRQ7cmRVVpWLQ8skEoQCiR7Wp0aeAtpR41fg/02i7Kp4itujixw1zanHRX+sLU/8EfnKmDpVbpJVWN8mxdz6ZZQDCrybZ2KpmUWEz2VVOIOEQiT64+rVq/uFIQRzqaEWxToSVtY/vdTZGkxb3Sa5UyVSjnZ5OauYI/XnLaQjaTMJNOO4OGLEolcSfHxkdNmO5TdGcvDCuunxdN6tbmxQAVZCJzcjN6NFNjQVKmWWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3104.namprd12.prod.outlook.com (20.178.243.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 03:30:26 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 03:30:26 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/9] drm/amdgpu: add hdp clock gating for Arcturus
Thread-Topic: [PATCH 3/9] drm/amdgpu: add hdp clock gating for Arcturus
Thread-Index: AQHVTdMk/WBwA9qQtEy8nhLv6ztE3qbyKd2g
Date: Fri, 9 Aug 2019 03:30:25 +0000
Message-ID: <MN2PR12MB35989F684730625B10ABB6348ED60@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
 <1565259714-30357-3-git-send-email-le.ma@amd.com>
In-Reply-To: <1565259714-30357-3-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 049198d4-530b-4beb-9b0a-08d71c79eb56
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3104; 
x-ms-traffictypediagnostic: MN2PR12MB3104:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31047F18F3FB6B4202F6BBA48ED60@MN2PR12MB3104.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(13464003)(6246003)(316002)(6306002)(305945005)(11346002)(2906002)(52536014)(486006)(55016002)(478600001)(2501003)(7696005)(7736002)(3846002)(8676002)(6116002)(25786009)(66066001)(446003)(66556008)(71190400001)(71200400001)(74316002)(5660300002)(4326008)(66476007)(81166006)(81156014)(229853002)(256004)(14444005)(86362001)(8936002)(186003)(26005)(476003)(53546011)(6506007)(66446008)(53936002)(66946007)(76176011)(102836004)(6436002)(33656002)(110136005)(14454004)(966005)(99286004)(76116006)(9686003)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3104;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9Kk+Q4FxaFpsmXLXSlPQpJBVTkMwgYgIwhAs/HwN5f5G9TRGyfAJbcsVlI/XoNyUOcV79VnI1ZUXe1MJMOlLkGQBCHU0mrG6ioM/BO60IKhDDK3OBTaZ9HmNiBEDGk10xwShf1z4H7DaSq17LyC197ygPpz1eTQHNVR+flqw8MfG4wyblrIWwS5wy3OADtqw1k9oJarcDJiShcHOtmPrZG8WdyauoGBQ8HT2tC0VKyS+0R9q5O3NYCH19aldcila3AZcupQ2NOqQb0hmQ8jkwgXmfSEcHGahHXcr1q4Y8kKRhpXa7x01NA98ry4ORAilss08hywstpXg4+5lkz4m+kDJ3uiMv6cOXgBBaQ5PvZe1LvwPjLKItb5zjNvW8qYdqjcD7OQRgR+Z1kuXfAM64mEUT65advcekiIUTDV3AQw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049198d4-530b-4beb-9b0a-08d71c79eb56
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 03:30:25.9037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARuWFSdMKZj6YLF5XwoyLUz/9YCjaoeym60gVj/P/+XsOqBPwxUlJRNyysVa/Ewi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxJrWf3LRZuH/R7Bu+0WUI+i/ZHP7SLg0lqI3xDcq9s=;
 b=Q8O+4OxRJCT55v94Sq+yezp6Ycpg9zkBT/xq3nOoy0PN0ih5a16zFMr/7/jfHwh9oxU+KioKoR47cu4myJXkjBlSLF6thfDcr/8fSo29+PDE/ETbFIuuaRPbhvKX8rXLFBwb4DpuvEVSGYNvKj5siH09r39ialxZqiNNSfb58rU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgTGUgTWENClNlbnQ6IFRo
dXJzZGF5LCBBdWd1c3QgMDgsIDIwMTkgNjoyMiBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpDYzogTWEsIExlIDxMZS5NYUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDMv
OV0gZHJtL2FtZGdwdTogYWRkIGhkcCBjbG9jayBnYXRpbmcgZm9yIEFyY3R1cnVzDQoNCltDQVVU
SU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KQWRkIGhkcCBDR0xTIGZvciBBcmN0dXJ1cyBpbiBzZXQg
Y29tbW9uIGNsb2NrZ2F0aW5nIGZ1bmN0aW9uDQoNCkNoYW5nZS1JZDogSTQ0ZTM5MmZhNWY3NjUz
OTA4YjM2YjA5MDJlNzIxZDU2ZWVkM2ViOTINClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBh
bWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDcgKysr
KysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQppbmRleCAwMDc1OGJlLi40ZmJhY2EzIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KQEAgLTExNTcsNyArMTE1Nyw4IEBAIHN0YXRp
YyB2b2lkIHNvYzE1X3VwZGF0ZV9oZHBfbGlnaHRfc2xlZXAoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIGJvb2wgZW5hYmxlICB7DQogICAgICAgIHVpbnQzMl90IGRlZiwgZGF0YTsNCg0KLSAg
ICAgICBpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfVkVHQTIwKSB7DQorICAgICAgIGlmIChh
ZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjAgfHwNCisgICAgICAgICAgICAgICBhZGV2LT5h
c2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykgew0KICAgICAgICAgICAgICAgIGRlZiA9IGRhdGEg
PSBSUkVHMzIoU09DMTVfUkVHX09GRlNFVChIRFAsIDAsIG1tSERQX01FTV9QT1dFUl9DVFJMKSk7
DQoNCiAgICAgICAgICAgICAgICBpZiAoZW5hYmxlICYmIChhZGV2LT5jZ19mbGFncyAmIEFNRF9D
R19TVVBQT1JUX0hEUF9MUykpIEBAIC0xMjg5LDYgKzEyOTAsMTAgQEAgc3RhdGljIGludCBzb2Mx
NV9jb21tb25fc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwNCiAgICAgICAgICAg
ICAgICBzb2MxNV91cGRhdGVfcm9tX21lZGl1bV9ncmFpbl9jbG9ja19nYXRpbmcoYWRldiwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUg
PyB0cnVlIDogZmFsc2UpOw0KICAgICAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICBjYXNlIENI
SVBfQVJDVFVSVVM6DQorICAgICAgICAgICAgICAgc29jMTVfdXBkYXRlX2hkcF9saWdodF9zbGVl
cChhZGV2LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0ZSA9PSBBTURfQ0df
U1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7DQorICAgICAgICAgICAgICAgYnJlYWs7DQogICAg
ICAgIGRlZmF1bHQ6DQogICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgIH0NCi0tDQoyLjcu
NA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1k
LWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
