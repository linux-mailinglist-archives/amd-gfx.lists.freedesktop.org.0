Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2FA1C5D
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 16:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033AC6E126;
	Thu, 29 Aug 2019 14:08:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC426E126
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 14:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVWRahGoGjX8lmO2D3SU2FezSwd+fY/yi8Du0AluDMX7x4u+VENJbL65Ch2p0UIiK15KBnFycyLoKCVgKeGCuY0dqwlNSIdR0ZzIXzXGm8HnQP6Uc6pHLRUDm6tzCHl9BfMPaxbL69V/6HJZWPazkaAaM7DGbWRIUqst6stePDO6BdOg/cX1ragWuJbMZWfSXHbgPLBCtyBLgkyfvZ1muGW9cP+uYyrzC9R5ZaEeJk7ICT9VzrCybpvJx3HABhAObwQNDqRzdITmZzFX3yoAdYzqwATRuzw6f8O4u8TbtrpmR/KJvoAaMhPr67vdiGCMsqk98RAj15ScUi/VBweNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X6mlON6nVDWNcouf6h//uWLT7DS8XRcC7BZ0eR29R0=;
 b=Z4RmAmZL14ngfDbVendmMx3dj5Iblu/p6kFP/IdxMGyON3GzyMrfkO8fwynl2KzULhm10kRS8RrUnXliQq+KQWgpGJektqRaRfOuV4SwsjiJlyrK4jRzipLU9H2Amhs1JxHh2UlQ+F7yzBr0l6GFvBHqOgwi0lmHoVi2szbCh4chn7QhgVcPRzFHECg1q6jaetFv9ARZ81xlQTuRgRXWbw0Wigh2zEPmGFN0tjFjsc2uKM2JFChsYA4XCTci+78mmS5hoGxjfjKZQHNt87WAFG/8k2Pny6eoRG46MNiOWrPwAW01mCF/vCPP6JBNYEi2Pczpp2CatPkvA9OxCSHo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1181.namprd12.prod.outlook.com (10.169.204.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 14:08:13 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813%6]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 14:08:13 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Topic: [PATCH 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Index: AQHVXdtFfi3TnX+12kCnB7mZW1y1nqcRu5gAgABtwQCAAADIAIAAAHgA
Date: Thu, 29 Aug 2019 14:08:13 +0000
Message-ID: <1444ae5f-0997-d1ce-3e1e-23fea8822c88@amd.com>
References: <1567022426-6612-1-git-send-email-andrey.grodzovsky@amd.com>
 <85798da5-a4f1-28d3-c80f-9f262743cac9@gmail.com>
 <9a46188b-b528-0d1f-8c3f-b6ce5b73649f@amd.com>
 <8c2b0bf3-47ff-ea3b-a682-7ec76240be4d@amd.com>
In-Reply-To: <8c2b0bf3-47ff-ea3b-a682-7ec76240be4d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BM1PR01CA0113.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::29)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2607:fea8:3edf:fe95::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5173293e-deb5-4282-e930-08d72c8a5488
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1181; 
x-ms-traffictypediagnostic: MWHPR12MB1181:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1181DD82B73D7BDFE172AE11EAA20@MWHPR12MB1181.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(189003)(199004)(54896002)(11346002)(64756008)(66556008)(66476007)(316002)(66446008)(54906003)(31686004)(66946007)(110136005)(2906002)(31696002)(25786009)(71190400001)(229853002)(36756003)(86362001)(76176011)(71200400001)(99286004)(256004)(52116002)(14444005)(4326008)(386003)(6506007)(81166006)(4744005)(2616005)(6116002)(6486002)(53546011)(81156014)(7736002)(14454004)(6436002)(53936002)(102836004)(8676002)(8936002)(486006)(478600001)(46003)(2501003)(5660300002)(446003)(186003)(476003)(6246003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1181;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jrFOUkjIY1QedZ4uWCrbt6pd3eyNC6nykI4b4V+1kHuSkPms0JLITxJQO61HkhwlKItN1tbq+hlfmk+I6sCeu+w8gBmlcnn64h9qGnN6xnsFMvMgP24yduO8/okRb/sc/lLWItg7RVxXNx+xCBR49/S8AFmC+hx2mjosV5RbXD5Qrgw0QBCbxuCUy/xONhFSRTtoB7cYiXW4XGgc/pQpPjPK6F9Y74yEq4ln/W5UIMpp6EARAVRFMsTZQ4jNEE7aGzMN8zEQ7lI68Ll8z+/yK+BDSSBV3zneUy/DSdIw21qISwCnjrjJZW1q8jfmz5L6iIFd+oNA6f6szwZGXYOj1Y7ruFFk3cTpoKcCG7RJGIwzvl+0TjjCLCqmBIionr8F1sUOQK0Do93cCb9Opx28EsfczHzHSJO+6QH9VVQ1Bls=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5173293e-deb5-4282-e930-08d72c8a5488
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 14:08:13.3651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7BRx84uZ95YE4FEimR9zRu90GLc+l1tD8BOjD8MMLiAdwnXa3xnRjYvDtASMU1In/0wezOY/HMKVs60DAac8nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1181
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X6mlON6nVDWNcouf6h//uWLT7DS8XRcC7BZ0eR29R0=;
 b=Xd3kn+cw7kBm84u95dI5y0L+zaVZHxriX2ycD+/KPgoWsX1QPyy3XRLqy6SG2Sv54f1UTkWUIsFvZCfE2G2O8OX9AclPDuwzPlBCtD7nDanPNdpEU5VprsrCACb9MOH2UyrQYSEvlPdWNog/J2HUOaF0wv3uNBOP5vCZXx7Wz5Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1743228239=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1743228239==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_1444ae5f0997d1ce3e1e23fea8822c88amdcom_"

--_000_1444ae5f0997d1ce3e1e23fea8822c88amdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWdyZWUsIHRoZSBwbGFjZW1lbnQgb2YgYW1kZ3B1X2FtZGtmZF9wcmUvcG9zdCBfcmVzZXQgaW4g
YW1kZ3B1X2RldmljZV9sb2NrL3VubG9ja19hZGV2IGlzIGEgYml0IHdpZXJkLg0KDQpBbmRyZXkN
Cg0KT24gOC8yOS8xOSAxMDowNiBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQoNCkZlbGl4
IGFkdmlzZWQgdGhhdCB0aGUgd2F5IHRvIHN0b3AgYWxsIEtGRCBhY3Rpdml0eSBpcyBzaW1wbHkg
dG8gTk9UDQpjYWxsIGFtZGdwdV9hbWRrZmRfcG9zdF9yZXNldCBzbyB0aGF0IHdoeSBJIGFkZGVk
IHRoaXMuIERvIHlvdSBtZWFuIHlvdQ0KcHJlZmVyIGFtZGdwdV9hbWRrZmRfcG9zdF9yZXNldCB0
byBiZSBvdXRzaWRlIG9mIGFtZGdwdV9kZXZpY2VfdW5sb2NrX2FkZXYgPw0KDQoNClllcywgZXhh
Y3RseS4gSXQgZG9lc24ndCBzZWVtcyB0byBiZSByZWxhdGVkIHRvIHRoZSB1bmxvY2sgb3BlcmF0
aW9uIGluDQp0aGUgZmlyc3QgcGxhY2UsIGJ1dCByYXRoZXIgb25seSBzaWduYWxzIHRoZSBLRkQg
dGhhdCB0aGUgcmVzZXQgaXMNCmNvbXBsZXRlZC4NCg0KQ2hyaXN0aWFuLg0KDQoNCg==

--_000_1444ae5f0997d1ce3e1e23fea8822c88amdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <059E3061B12FBD4F90DF7A950310A483@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPHA+QWdyZWUsIHRoZSBwbGFjZW1lbnQgb2YgYW1kZ3B1X2Ft
ZGtmZF9wcmUvcG9zdCBfcmVzZXQgaW4gYW1kZ3B1X2RldmljZV9sb2NrL3VubG9ja19hZGV2IGlz
IGEgYml0IHdpZXJkLjwvcD4NCjxwPkFuZHJleTxicj4NCjwvcD4NCjxkaXYgY2xhc3M9Im1vei1j
aXRlLXByZWZpeCI+T24gOC8yOS8xOSAxMDowNiBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6
PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6OGMyYjBiZjMt
NDdmZi1lYTNiLWE2ODItN2VjNzYyNDBiZTRkQGFtZC5jb20iPg0KPGJsb2NrcXVvdGUgdHlwZT0i
Y2l0ZSIgc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+DQo8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJl
IiB3cmFwPSIiPkZlbGl4IGFkdmlzZWQgdGhhdCB0aGUgd2F5IHRvIHN0b3AgYWxsIEtGRCBhY3Rp
dml0eSBpcyBzaW1wbHkgdG8gTk9UDQpjYWxsIGFtZGdwdV9hbWRrZmRfcG9zdF9yZXNldCBzbyB0
aGF0IHdoeSBJIGFkZGVkIHRoaXMuIERvIHlvdSBtZWFuIHlvdQ0KcHJlZmVyIGFtZGdwdV9hbWRr
ZmRfcG9zdF9yZXNldCB0byBiZSBvdXRzaWRlIG9mIGFtZGdwdV9kZXZpY2VfdW5sb2NrX2FkZXYg
Pw0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFw
PSIiPlllcywgZXhhY3RseS4gSXQgZG9lc24ndCBzZWVtcyB0byBiZSByZWxhdGVkIHRvIHRoZSB1
bmxvY2sgb3BlcmF0aW9uIGluIA0KdGhlIGZpcnN0IHBsYWNlLCBidXQgcmF0aGVyIG9ubHkgc2ln
bmFscyB0aGUgS0ZEIHRoYXQgdGhlIHJlc2V0IGlzIA0KY29tcGxldGVkLg0KDQpDaHJpc3RpYW4u
DQoNCjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_1444ae5f0997d1ce3e1e23fea8822c88amdcom_--

--===============1743228239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1743228239==--
