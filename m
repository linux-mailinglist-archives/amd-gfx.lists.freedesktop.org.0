Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B35A2EC0
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 07:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C468B892ED;
	Fri, 30 Aug 2019 05:15:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760083.outbound.protection.outlook.com [40.107.76.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF378892ED
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 05:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckHOyE8fn/bhCyOD7FpHJwP2hKdhcBh9Mh4u/ej//v5wShiHbYbq9LNTIcJ8X8dVPblx4p0PE5lD8gk1bDp19DkYi7ZEyeJDqgc9HPWVxNbHXeW5F+uu3DcVXiSccxJH/VrrS4KncOhgCJg3l/VSs1M4TYGJW/CFTPMi3ZmfYhQvgO7TqfG3lGuTorU5n4+KfLBrTM/GCWvli3r4J/b4dyl2bkduLS+g3w5DgJy0vxFdWbihO+se63byaZXgwujNQm25/Wjuuf6giAi7fGjo7R+yMFjPXHBIPMUdbvwr+AlxSzgCIc/d3Kk0zOgvms3Iz1wl3sklhkkxavhyMhHTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng+IHTBPmkCwc6KKx8NYbBfT0fcEy3gw/A7wEejpCuU=;
 b=jtELYZpO84T0GH0KXfC1FhZvVrzttf8t2NMmI6By3XT0hI7M5VV896ao+L652H6Qep8fOyoTu1Gvm2sIv9ut3AE2d5MzGgP9IOJ/69h8C/UhVt539JITGzjqZECYMFQMv1uDfw3ZrXDD0pQ47p5zkpkugGCLv3AGX9F/awurllPb6dM04t8Vek7b+8JVy+vwBxUwG/fBct8VIPcghUel9d10SaEe0m76lFxtpwtEjZjwEbutIHrludu3OMhtYvGc6mbUZWGOwd8ww4OKQmnpdTwolU7p7u7/FLNLqspDyNRg4bUoM8VN59QnSzoMWPt7QlaFo//T/sCwp2xY7C9EiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4220.namprd12.prod.outlook.com (10.141.187.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 05:15:00 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 05:15:00 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Remove unnecessary TLB workaround
Thread-Topic: [PATCH 1/2] drm/amdgpu: Remove unnecessary TLB workaround
Thread-Index: AQHVXvHelAlKJF2Gf0ODBLaAFSE4uw==
Date: Fri, 30 Aug 2019 05:14:59 +0000
Message-ID: <20190830051443.3906-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77558b86-8976-4b71-35f2-08d72d090143
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4220; 
x-ms-traffictypediagnostic: DM6PR12MB4220:
x-microsoft-antispam-prvs: <DM6PR12MB42203B1E2999196AB1AFC43C92BD0@DM6PR12MB4220.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39850400004)(346002)(396003)(199004)(189003)(3846002)(14454004)(66476007)(2501003)(99286004)(5640700003)(66556008)(66946007)(2351001)(66446008)(64756008)(2906002)(316002)(25786009)(256004)(14444005)(71190400001)(8936002)(305945005)(6512007)(7736002)(6436002)(50226002)(81166006)(6506007)(8676002)(53936002)(478600001)(52116002)(81156014)(6486002)(186003)(476003)(1076003)(26005)(2616005)(486006)(102836004)(36756003)(86362001)(6916009)(71200400001)(6116002)(66066001)(5660300002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4220;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cWnUQSLr/FzNHchL8PBITTCxCHHkkjdK0sep7/zzyiIoOzyBwDcZS7JIuaZdNWjgr/V5kbNSPDAsi+5ugNxlThn8Ru96xHH7AJNWN21/oD6S6F64P8Gf5C1FFcvQ+fFnPO/4vKtFxTupsfKmxJzPZtsC//u7dEZssakolOmr0ksL1I5qnm9jwsW5LnNbstbGkbWL2k+8gB2MsuK1h1jcY1IbsOkJL8yPbhqYDbWb50H5IL/DlPdyjXCKHrVRJNMlH3D4VX6JPd7HOOp0HPomdaLGQqG7XntXHZTKTaSJGsbVlTb9Vr3Ga6RFrKoy6PRT/rPwmxX5N+v8b9zQfjWLEwlZdfGQjPLVVx03YNc6dDLcZg+su70/Z4XKe0m8FvkEoPrlNe+j30IAh9wa5ecS3r0xkt089w79bPnXKMR7yXI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77558b86-8976-4b71-35f2-08d72d090143
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 05:14:59.7250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poH/BGBgDMCfyPdtCrIxC15FF2WIVpHtQw1ksakyDw6vKhX3EBcdgG9coEaMkisABMoxVL+s8aGanyGS0fTlqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng+IHTBPmkCwc6KKx8NYbBfT0fcEy3gw/A7wEejpCuU=;
 b=BSObwxpR+5npGRseQyt6B7XQKtMdJZ5g9EsU7ZKr4umvdiK+He7080+7H8N8rjebMYtLAM4RvE37yu+uUjnSWQlOFTp+/IvAz3pD+dAIpIFsk24a1hIIBgIn5WUKQfXpirrg7IPgSHea3V/j7uePShYQETdHvia+hSx26QVtg2Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB3b3JrYXJvdW5kIGlzIGJldHRlciBoYW5kbGVkIGluIHVzZXIgbW9kZSBpbiBhIHdheSB0
aGF0IGRvZXNuJ3QKcmVxdWlyZSBhbGxvY2F0aW5nIGV4dHJhIG1lbW9yeSBhbmQgYnJlYWtpbmcg
dXNlcnB0ciBCT3MuCgpUaGUgVExCIGJ1ZyBpcyBhIHBlcmZvcm1hbmNlIGJ1Zywgbm90IGEgZnVu
Y3Rpb25hbCBvciBzZWN1cml0eSBidWcuCkhlbmNlIGl0IGlzIHNhZmUgdG8gcmVtb3ZlIHRoaXMg
a2VybmVsIHBhcnQgb2YgdGhlIHdvcmthcm91bmQgdG8KYWxsb3cgYSBiZXR0ZXIgd29ya2Fyb3Vu
ZCB1c2luZyBvbmx5IHZpcnR1YWwgYWRkcmVzcyBhbGlnbm1lbnRzIGluCnVzZXIgbW9kZS4KClNp
Z25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8IDEyICst
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMKaW5kZXggNDJkMjA5ZjVmZDE4Li4yYzczZWE3YzQyNWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKQEAgLTExMTAsNyArMTExMCw2
IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoCiAJdWludDY0
X3QgdXNlcl9hZGRyID0gMDsKIAlzdHJ1Y3QgYW1kZ3B1X2JvICpibzsKIAlzdHJ1Y3QgYW1kZ3B1
X2JvX3BhcmFtIGJwOwotCWludCBieXRlX2FsaWduOwogCXUzMiBkb21haW4sIGFsbG9jX2RvbWFp
bjsKIAl1NjQgYWxsb2NfZmxhZ3M7CiAJaW50IHJldDsKQEAgLTExNjUsMTUgKzExNjQsNiBAQCBp
bnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAogCWlmICgoKm1lbSkt
PmFxbF9xdWV1ZSkKIAkJc2l6ZSA9IHNpemUgPj4gMTsKIAotCS8qIFdvcmthcm91bmQgZm9yIFRM
QiBidWcgb24gb2xkZXIgVkkgY2hpcHMgKi8KLQlieXRlX2FsaWduID0gKGFkZXYtPmZhbWlseSA9
PSBBTURHUFVfRkFNSUxZX1ZJICYmCi0JCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9GSUpJICYm
Ci0JCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9QT0xBUklTMTAgJiYKLQkJCWFkZXYtPmFzaWNf
dHlwZSAhPSBDSElQX1BPTEFSSVMxMSAmJgotCQkJYWRldi0+YXNpY190eXBlICE9IENISVBfUE9M
QVJJUzEyICYmCi0JCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9WRUdBTSkgPwotCQkJVklfQk9f
U0laRV9BTElHTiA6IDE7Ci0KIAkoKm1lbSktPmFsbG9jX2ZsYWdzID0gZmxhZ3M7CiAKIAlhbWRn
cHVfc3luY19jcmVhdGUoJigqbWVtKS0+c3luYyk7CkBAIC0xMTg5LDcgKzExNzksNyBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAogCiAJbWVtc2V0KCZicCwg
MCwgc2l6ZW9mKGJwKSk7CiAJYnAuc2l6ZSA9IHNpemU7Ci0JYnAuYnl0ZV9hbGlnbiA9IGJ5dGVf
YWxpZ247CisJYnAuYnl0ZV9hbGlnbiA9IDE7CiAJYnAuZG9tYWluID0gYWxsb2NfZG9tYWluOwog
CWJwLmZsYWdzID0gYWxsb2NfZmxhZ3M7CiAJYnAudHlwZSA9IGJvX3R5cGU7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
