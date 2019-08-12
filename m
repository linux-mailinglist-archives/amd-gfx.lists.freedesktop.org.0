Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B8896B6
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 07:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557C989DF7;
	Mon, 12 Aug 2019 05:24:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750071.outbound.protection.outlook.com [40.107.75.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123EA89DD5
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 05:24:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTJKoPyjouTEEeGnPY1sRCTGbgbktxOTZhsDmuHKP2Foal9qizvxtEpdK8BQErIoTCn4MvwTwIZ4sBMlAelhYcQ18EQRAWO1FQXFsu0BGejwIUzlw5LkjEOmEwFNSoWV0rcc8UkZAjrVO2hPKxDQ/dkFWf2Lt1Wv6RaVdO3is5Bp8LGXdK/EVU+aQBQ7K99kdzDuvBwPungTjoO4O5Nh+l6iYkUn5xqSvLZ1mkJHnnEi10KCQcR1n+YhdpHGYXGLt8AAnV6lyTqrh7uVqQoHQqpgZTyZEVmuDoo3xlz+3vAacEYgYgvO1hoGkerAS4KO14qXadbvdnI5ihN/jjuHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDnbywGiBUaao+1oDeSpK7id/5Ba2cD5xrXNh6k/3yY=;
 b=Fv0b0ZFrXPTY6hMIM4Hd1FapYigPTZSLEZX5J8l3lC6bqz7xs3cfZ1SD9S2goeSnpbbfFhlNt+ywP4NdfmYU8VNaQM61LgkLKiajaYifbeSquJwzwR3wYJ1X6mRY9s/XTYsDTNGbpM6L7QBD5wp9+uviN0/ltIxFst5dGADmVB+4SgahAX3jitzRCam4kGcDMuzxI83aAcS+ovYp8vy+EyHmXxSnIGTg1WUKkWdSLAXA83Ue08YUEy+Rzw4iO67WU/x5LeOV1EdS5JOOHMbnXrys+eyLLHHtT3NzXnz6Km1sMgjIdXbvvo4rtFwmW3UAhJcPwLPdpzUSk9f/mBSLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3888.namprd12.prod.outlook.com (10.255.237.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Mon, 12 Aug 2019 05:24:45 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.020; Mon, 12 Aug 2019
 05:24:45 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/4] drm/amdgpu: increase CGCG gfx idle threshold for
 Arcturus
Thread-Topic: [PATCH 2/4] drm/amdgpu: increase CGCG gfx idle threshold for
 Arcturus
Thread-Index: AQHVTqVlDh/RvF/9VUaNgl35hjg7RKb2/yog
Date: Mon, 12 Aug 2019 05:24:45 +0000
Message-ID: <MN2PR12MB3598346C347D13D3D16B52BB8ED30@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>
 <1565350016-7071-2-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350016-7071-2-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2038b918-a319-4cc3-107b-08d71ee56311
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3888; 
x-ms-traffictypediagnostic: MN2PR12MB3888:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB38882C07E3DB48B3F03628E28ED30@MN2PR12MB3888.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(189003)(13464003)(199004)(8676002)(305945005)(3846002)(74316002)(316002)(6506007)(966005)(53546011)(7696005)(478600001)(76176011)(6246003)(229853002)(71190400001)(6116002)(7736002)(14454004)(2906002)(99286004)(66066001)(71200400001)(110136005)(256004)(6436002)(14444005)(33656002)(81156014)(81166006)(11346002)(446003)(186003)(25786009)(66476007)(66946007)(66556008)(66446008)(76116006)(64756008)(4326008)(53936002)(55016002)(102836004)(2501003)(8936002)(486006)(476003)(9686003)(6306002)(26005)(86362001)(52536014)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3888;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TfUL+bktinkUs1aTnADWtnp4wsLAZtLmspZkHi9hi1WWV94rBflAG9WiPTUZp3ngQGNBz2kPtxqBv8wQ9KVlDhsw36ZC+QEiyX2gIaDqngDmh8rVv4RWRUeOj4G6lZ7F22Np/ElIQL0ZhMeAzwtrjXSXOHuhLKD4lAk533H5KpuiE0rbUrjcRBPMHKXF2T9hCZiURYX/qAAu2/TTGRoLLHEv6F05UVe0P+u2ibJmTiE1zpw96u330RJxjGhOFL8/SMnzqPhaSk46O8XElCnk3dVUaJ/WWVqbmJeuu+zsVgQVqCdw9yAhTRubT5xcOD2ls9Zs1hXDk+OhNcL4NwvtOwyxsaQuqCUdQlDVzGOjBy+TRupAJekVJ9r86nLOvmDN3Uj19YrspUuGB6lDVBHxy+M0MMKRsqksBJcKrX1NlVw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2038b918-a319-4cc3-107b-08d71ee56311
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 05:24:45.2962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FEm5CSXw5mJ/LYMI0uUcJKM3/wfr2qIqJLRDIcw2s4dEDFR/hzUjKHYGHJmwnh62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3888
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDnbywGiBUaao+1oDeSpK7id/5Ba2cD5xrXNh6k/3yY=;
 b=hVb78Ohy24+0E8nTIOwniB9L4nVoRaWvA6fxZb8EFvEykllBt/Zsm4GL4nd9Cl2M2eGfwYkypaXqUPNhTxW/ATrKN4V5Em1CyrBSrjUxcEtTbGIo5M5I+f4rV8hcsbPwh/FCEoYle+8c5pRRkS7KoMIpidz3sGfifQYW7rsduLA=
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
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgTGUgTWENClNlbnQ6IEZy
aWRheSwgQXVndXN0IDA5LCAyMDE5IDc6MjcgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KQ2M6IE1hLCBMZSA8TGUuTWFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAyLzRd
IGRybS9hbWRncHU6IGluY3JlYXNlIENHQ0cgZ2Z4IGlkbGUgdGhyZXNob2xkIGZvciBBcmN0dXJ1
cw0KDQpbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCkZvbGxvdyB0aGUgaHcgc3BlYywgYW5k
IG5vIG5lZWQgdG8gY29uc2lkZXIgZ2Z4b2ZmIG9uIEFyY3R1cnVzDQoNCkNoYW5nZS1JZDogSWI5
Y2FkNzliMWI5YzA5NjAxNDQ0N2ZjMGE3ZDI5Y2RiNTk0ZTE1ZTMNClNpZ25lZC1vZmYtYnk6IExl
IE1hIDxsZS5tYUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y5XzAuYyB8IDggKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCmluZGV4
IDc4MTUwZmYuLjliODVhNzMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
DQpAQCAtNDY3Nyw4ICs0Njc3LDEyIEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX3VwZGF0ZV9jb2Fy
c2VfZ3JhaW5fY2xvY2tfZ2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2DQogICAgICAg
ICAgICAgICAgLyogZW5hYmxlIGNnY2cgRlNNKDB4MDAwMDM2M0YpICovDQogICAgICAgICAgICAg
ICAgZGVmID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbVJMQ19DR0NHX0NHTFNfQ1RSTCk7DQoNCi0g
ICAgICAgICAgICAgICBkYXRhID0gKDB4MzYgPDwgUkxDX0NHQ0dfQ0dMU19DVFJMX19DR0NHX0dG
WF9JRExFX1RIUkVTSE9MRF9fU0hJRlQpIHwNCi0gICAgICAgICAgICAgICAgICAgICAgIFJMQ19D
R0NHX0NHTFNfQ1RSTF9fQ0dDR19FTl9NQVNLOw0KKyAgICAgICAgICAgICAgIGlmIChhZGV2LT5h
c2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykNCisgICAgICAgICAgICAgICAgICAgICAgIGRhdGEg
PSAoMHgyMDAwIDw8IFJMQ19DR0NHX0NHTFNfQ1RSTF9fQ0dDR19HRlhfSURMRV9USFJFU0hPTERf
X1NISUZUKSB8DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJMQ19DR0NHX0NHTFNf
Q1RSTF9fQ0dDR19FTl9NQVNLOw0KKyAgICAgICAgICAgICAgIGVsc2UNCisgICAgICAgICAgICAg
ICAgICAgICAgIGRhdGEgPSAoMHgzNiA8PCBSTENfQ0dDR19DR0xTX0NUUkxfX0NHQ0dfR0ZYX0lE
TEVfVEhSRVNIT0xEX19TSElGVCkgfA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBS
TENfQ0dDR19DR0xTX0NUUkxfX0NHQ0dfRU5fTUFTSzsNCiAgICAgICAgICAgICAgICBpZiAoYWRl
di0+Y2dfZmxhZ3MgJiBBTURfQ0dfU1VQUE9SVF9HRlhfQ0dMUykNCiAgICAgICAgICAgICAgICAg
ICAgICAgIGRhdGEgfD0gKDB4MDAwRiA8PCBSTENfQ0dDR19DR0xTX0NUUkxfX0NHTFNfUkVQX0NP
TVBBTlNBVF9ERUxBWV9fU0hJRlQpIHwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UkxDX0NHQ0dfQ0dMU19DVFJMX19DR0xTX0VOX01BU0s7DQotLQ0KMi43LjQNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBs
aXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
