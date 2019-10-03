Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0FCB1A0
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 00:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CE989A74;
	Thu,  3 Oct 2019 22:00:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F5289A74
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 22:00:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWJNUGNohNeZ6qZun3SqaZ/AUq4cslRkINAQqCf/KW4MRi6xHQOT/HRb1Lw+cbFEN7FCDhI9xoshjOym4nU65eUtGrS5j6qXPaQN5Cilx8mYSpVBvrN/8cMYdmqPXOLWcnR5t8AYinVVEjv0/u+iHfX4PqYdmJzsJOPnMw3jsnj3WlcgX9mnwY4B1bSnSIRzqVb+NhR7u2BQ09HZ/HGCcXQu9BRpARfCpGeky/qkCaHrd3NEpCpnfpov3uy4bGLiGMJRlJfZkV2XK2djVJbmId79saMTA8570SewKmaU0s++Z5ueX4+exvSTFwWDctKiYu6Ok2wzFny2G2eVvP93tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PVZ4V3J7WXCWzZ2bxMsUbwe0uQiTv9f94VsYdAaBhc=;
 b=QAcqTavPYTAgEqei/hKUPj6W4B69Obuxg8SXGJpQx1IPd6kDH4C0zEMUpe59KWg9hpaoALFE0DgxLHUKNaozkk32SI86KGGfESlxWsQZEcUuot43Bn0TP8fmrBevm54RMtfd65jBM2p/tm8fjQFTpobo4U4s+WStzeZkQRGFroqZBHu9gFvDBDhiWlzrx5Sp1uUo3elPWJRNmJxVXlx4C88eaD9/DfCC7V4ZeLcvEZJUSQuc54yHkJO6w71Wf2EViBCAGXHJ1v+B2zRIwmZMBPFIleZ4gsmYm4Ys9CKetscLONIGOC4hBoHBAkAinkkKGSKlsliZwULvbkoDjYxyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 3 Oct 2019 22:00:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::b5e5:7607:69b9:620a]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::b5e5:7607:69b9:620a%5]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 22:00:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: [PATCH 1/1] drm/amdgpu: Fix error handling in amdgpu_ras_recovery_init
Thread-Topic: [PATCH 1/1] drm/amdgpu: Fix error handling in
 amdgpu_ras_recovery_init
Thread-Index: AQHVejYBosupmZHMGEK9PdhWAuK0/w==
Date: Thu, 3 Oct 2019 22:00:44 +0000
Message-ID: <20191003220028.13107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dec9dbab-10b4-48ac-a166-08d7484d23e5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB35155BCD4E70B566F02758DE929F0@DM6PR12MB3515.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:270;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(199004)(189003)(305945005)(186003)(26005)(36756003)(316002)(256004)(14444005)(14454004)(102836004)(86362001)(6506007)(386003)(478600001)(4744005)(25786009)(110136005)(7736002)(81166006)(8936002)(52116002)(71200400001)(71190400001)(2616005)(476003)(99286004)(4326008)(6636002)(5660300002)(486006)(66476007)(1076003)(64756008)(66946007)(66446008)(6512007)(6486002)(6436002)(6116002)(3846002)(2906002)(2501003)(8676002)(66066001)(81156014)(50226002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3515;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rYuY/9XwBXuLqfKHxYNg5eSQryJ30vIGtNlC9/6bwYI0WGAf2B3fd+OJtayMsAIiCP+kjV/l0reruTGCIAN7hUg6twO8jqOoT6o3WvVlMD0RN1Qs+MaMSmoCM8bpDK0uVRlWUXUJ0Ihaisq+CBebfHUjC23zFLxSdMPPA6DEfJ4VW5OcrwOldaYBHV9KhNaBvkpCMztHlvdqH2pd/QsILk6G6QX2Mfv7Kp0V62/LN/i5Hhr92oMsFl4Mfka0yhp9jQg/cRD2AV83zIm/w/KM/N3tlRd91ZRCKy33M1PoIi6zfH8RMyN62/6UFbq5RL82Cc3EdRYxx7zYUWNsYczeV+JViguou7z+WQ8tVOgr9jo4qfEIIoimkrAvYW1bhjoZMNighrDlKg7t6uXDMNIV1P0fdpDNWrkXcl4n5vJSfvM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec9dbab-10b4-48ac-a166-08d7484d23e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 22:00:45.0266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iauLSkpvoeo/xHX44ohjSKQqDnVH2FxGhy8IgJX6FmWWHnWpHeZzOqQOiKfxOXspjNkkBrtgAytMD//O3um2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3515
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PVZ4V3J7WXCWzZ2bxMsUbwe0uQiTv9f94VsYdAaBhc=;
 b=nvDJw1Yi8lUnuC3NMyzgfJ2xldTTwGy7Na6ZeWg5+Lk1o1Pz/flhp58lj3sUWOFCBR0fQy9MhantH4+zd7PT44+bz4bTSgbYtXm3q8H/SIy+EzKjI8QuOLX6A6BSzFlEcwgRxLfdgvePguQrQE8CfZmkz8I0NJMiM9hD2knkAug=
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
Cc: "Cox, Philip" <Philip.Cox@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG9uJ3Qgc2V0IGEgc3RydWN0IHBvaW50ZXIgdG8gTlVMTCBiZWZvcmUgZnJlZWluZyBpdHMgbWVt
YmVycy4gSXQncwpoYXJkIHRvIHNlZSB3aGF0J3MgaGFwcGVuaW5nIGR1ZSB0byBhIGxvY2FsIHBv
aW50ZXItdG8tcG9pbnRlciBkYXRhCmFsaWFzaW5nIGNvbi0+ZWhfZGF0YS4KClNpZ25lZC1vZmYt
Ynk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYwppbmRleCA0ODY1NjhkZWQ2ZDYuLjBlMmVlNTg2OWI1ZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTU0MiwxMCArMTU0MiwxMCBAQCBpbnQg
YW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogcmVs
ZWFzZToKIAlhbWRncHVfcmFzX3JlbGVhc2VfYmFkX3BhZ2VzKGFkZXYpOwogZnJlZToKLQljb24t
PmVoX2RhdGEgPSBOVUxMOwogCWtmcmVlKCgqZGF0YSktPmJwcyk7CiAJa2ZyZWUoKCpkYXRhKS0+
YnBzX2JvKTsKIAlrZnJlZSgqZGF0YSk7CisJY29uLT5laF9kYXRhID0gTlVMTDsKIG91dDoKIAlE
Uk1fV0FSTigiRmFpbGVkIHRvIGluaXRpYWxpemUgcmFzIHJlY292ZXJ5IVxuIik7CiAKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
