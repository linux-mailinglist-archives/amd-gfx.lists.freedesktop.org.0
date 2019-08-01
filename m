Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE47DBFA
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 14:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F5C6E5C9;
	Thu,  1 Aug 2019 12:56:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700048.outbound.protection.outlook.com [40.107.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026DF6E5C9
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 12:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz6RL8jpNzrGhH8nJVjkRh+msZQXHmKYNxivr6RGkIEJQHY9diiTTOuosru8xvtGmfaW96vTnvc6972Vcux70cHc5Hf1bImrvEYVIiBfaoslM9fU/8G5vWyKirkmUI3UJpp5QUwR6M67c21goLv6uks/NbkmVZnOaVuk3gQCxjvp9B75TGeugDNF8380tdeD/tfKSWWTMwq3Whj8/ZkJar9t9NJzgJkR+JjhDTBFCrsa1UGy960cxzJwJ8u4SZatc9sknuUuGiaNCesM9ojxQDSRS3nZZKQiIxF8Y8rJImf2zgHxhYgmYz+xXjfdVRvhZJrs8TytVuWN7sNOWShuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ4KxQpGnRxF+eLMjIomlaLOfMAvsVoeYl5V4pOUe30=;
 b=NusuENPteEjJYsVrPxnYHimj/mKI1OTdnlVNpbsT0hPievVYmoca57AuI2kmy8Z8xwMTIwnbL9P2PXOlMMB8m3D7d9fCkSIukldntzQTzYQcDwiZ7SqQQx7+nqVc1pF3xua6pMuX/3VccSpXhC7c+o3Hgsrdyw8GpXLnMP+40aaVK1GtOzWojuPRDj9yTUDUFaR3eVX2lMKlqg4M73/nOmW8WsJPlA1aH3N1PMZyC1A+eILK+CX4gyzcH52d0A/d8B5ygOS08r5s1TwLr90SWeOpm0hyk91KtHC3BAI59lYbTDE04sHxE20LSH4rC8hzQoONVBmWL/Oh8fNL22imew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1275.namprd12.prod.outlook.com (10.168.237.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 12:56:03 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9562:72ed:ddbe:868c]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9562:72ed:ddbe:868c%6]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 12:56:03 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH 0/5] enable umc ras ce interrupt v2
Thread-Topic: [PATCH 0/5] enable umc ras ce interrupt v2
Thread-Index: AQHVSF//tz0/JD9Zc0exrn2udK6FdqbmQANg
Date: Thu, 1 Aug 2019 12:56:03 +0000
Message-ID: <DM5PR12MB14185BCB64112F6D9C39BEF1FCDE0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190801115454.21867-1-tao.zhou1@amd.com>
In-Reply-To: <20190801115454.21867-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba8d723a-16c1-4f16-3c04-08d7167f9c87
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1275; 
x-ms-traffictypediagnostic: DM5PR12MB1275:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB12757906573C0EFC58899201FCDE0@DM5PR12MB1275.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:576;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(13464003)(9686003)(71200400001)(52536014)(5660300002)(110136005)(8676002)(66066001)(25786009)(8936002)(66476007)(6636002)(6436002)(81166006)(68736007)(64756008)(76116006)(53936002)(66556008)(305945005)(476003)(74316002)(66446008)(6116002)(3846002)(6306002)(229853002)(14454004)(55016002)(33656002)(11346002)(486006)(66946007)(81156014)(478600001)(2501003)(99286004)(316002)(76176011)(966005)(53546011)(102836004)(446003)(7736002)(6506007)(86362001)(2906002)(256004)(71190400001)(14444005)(4326008)(26005)(186003)(6246003)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0r48YRcdf8xLUVOmq/EahefyivNKj24nexfvaPkrK3iw6Nor2bRFkMCkSKbptY/ByidlgqiDCOvfPqgW1RRgvehWxfLn3d+OCyoQWsBS3SRdwXLkqJUc1u6GcX4/ZqG77jSujD/NgM78/lN9A3tyac4hIRyz+ZwkLb3G3ilcwvXK0iRo4rCtK33OcMtFiFaQEyn+4S7M/cFH7dIZfddk6nonPmCOyH0887XsM/YI/TWtSiXvOcgCDsvKRL6ovTcwHilSoY9Zrs5FQPRciiILKpxtIMmJiLBdtDONiTC6NarHT4EaC+6pB+/ccvUK7e3myXIXnShJ7153gfH2UYNscTFzkSRwLJoqUGquCKMM/cy10KWRE4MpNfz2eNJfaqlbcsJn1lYNXlNGCYMMrmy2aNGTw/JC8UmzxUS7C6z/S3Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8d723a-16c1-4f16-3c04-08d7167f9c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 12:56:03.7419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ4KxQpGnRxF+eLMjIomlaLOfMAvsVoeYl5V4pOUe30=;
 b=X+sykqD+aBxz0R1at1/T2gxDTUNJudVgnQeZK//sD92S1Be0m1pfAiWb6FQoIht72x1nN53nnwV9NpfAnMkE/XNSeqCPdLPXz1J8bsyFrKhgFX7y4lt7XzFWjS1l7Ne1g24A11SQtXzreJymCPZPxuuHbstwCbmflUKE0lmBlxs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzDQoNClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIFRhbyBaaG91DQpTZW50OiAyMDE55bm0OOaciDHml6UgMTk6NTUNClRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT47IExpLCBEZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPjsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT4NCkNj
OiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAwLzVdIGVu
YWJsZSB1bWMgcmFzIGNlIGludGVycnVwdCB2Mg0KDQpUaGVzZSBwYXRjaGVzIGFkZCBzdXBwb3J0
IGZvciB1bWMgY2UgaW50ZXJydXB0LCB0aGUgaW50ZXJydXB0IGlzIGNvbnRyb2xsZWQgYnkgYSBl
cnJvciBjb3VudCB0aHJlc2hvbGQuDQoNCnYyOiBjb3JyZWN0IHR5cG8gaW4gY29tbWl0IGRlc2Ny
aXB0aW9uIGFuZCB1cGRhdGUgY29tbWVudCBvZiBwYXRjaCAjMiBhZGQgcGF0Y2ggIzUgdG8gcmVw
bGFjZSBBTURHUFVfUkFTX1VFIHdpdGggQU1ER1BVX1JBU19TVUNDRVNTDQoNClRhbyBaaG91ICg1
KToNCiAgZHJtL2FtZGdwdTogc3VwcG9ydCBjZSBpbnRlcnJ1cHQgaW4gcmFzIG1vZHVsZQ0KICBk
cm0vYW1kZ3B1OiBpbXBsZW1lbnQgdW1jIHJhcyBpbml0IGZ1bmN0aW9uDQogIGRybS9hbWRncHU6
IHVwZGF0ZSB0aGUgY2FsYyBhbGdvcml0aG0gb2YgdW1jIGVjYyBlcnJvciBjb3VudA0KICBkcm0v
YW1kZ3B1OiBvbmx5IHVuY29ycmVjdGFibGUgZXJyb3IgbmVlZHMgZ3B1IHJlc2V0DQogIGRybS9h
bWRncHU6IHJlcGxhY2UgQU1ER1BVX1JBU19VRSB3aXRoIEFNREdQVV9SQVNfU1VDQ0VTUw0KDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTQgKysrKysrLS0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgIHwgIDIgKy0NCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAgOCArKystLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jICB8ICAyICstDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdW1jX3Y2XzEuYyAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmggICB8ICA3ICsrKysrDQogNiBmaWxl
cyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCg0KLS0NCjIuMTcu
MQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1k
LWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
