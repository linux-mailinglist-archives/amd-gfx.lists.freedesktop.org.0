Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB19109BA
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2019 16:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFA58828C;
	Wed,  1 May 2019 14:59:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D468828C
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2019 14:59:29 +0000 (UTC)
Received: from BYAPR12MB3384.namprd12.prod.outlook.com (20.178.55.225) by
 BYAPR12MB3525.namprd12.prod.outlook.com (20.179.94.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Wed, 1 May 2019 14:59:27 +0000
Received: from BYAPR12MB3384.namprd12.prod.outlook.com
 ([fe80::7496:be8b:650:d66a]) by BYAPR12MB3384.namprd12.prod.outlook.com
 ([fe80::7496:be8b:650:d66a%4]) with mapi id 15.20.1835.018; Wed, 1 May 2019
 14:59:27 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] device_cgroup: Export __devcgroup_check_permission
Thread-Topic: [PATCH 3/4] device_cgroup: Export __devcgroup_check_permission
Thread-Index: AQHVAC55ig/tjOJIrUisrubOK/T1Gw==
Date: Wed, 1 May 2019 14:59:27 +0000
Message-ID: <20190501145904.27505-4-Harish.Kasiviswanathan@amd.com>
References: <20190501145904.27505-1-Harish.Kasiviswanathan@amd.com>
In-Reply-To: <20190501145904.27505-1-Harish.Kasiviswanathan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YQBPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::37) To BYAPR12MB3384.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::33)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c808b2a7-eb46-4b11-d6ca-08d6ce459b53
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3525; 
x-ms-traffictypediagnostic: BYAPR12MB3525:
x-microsoft-antispam-prvs: <BYAPR12MB3525327CA9A72C8D948D6BEE8C3B0@BYAPR12MB3525.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(366004)(346002)(136003)(189003)(199004)(1076003)(5660300002)(316002)(25786009)(68736007)(4326008)(86362001)(7736002)(2906002)(110136005)(52116002)(2501003)(36756003)(6512007)(3846002)(6116002)(99286004)(4744005)(53936002)(186003)(76176011)(8676002)(14444005)(256004)(66946007)(102836004)(50226002)(14454004)(66066001)(73956011)(11346002)(478600001)(66556008)(72206003)(71190400001)(81156014)(81166006)(2616005)(66476007)(446003)(64756008)(71200400001)(476003)(305945005)(26005)(386003)(486006)(6486002)(8936002)(6436002)(6506007)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3525;
 H:BYAPR12MB3384.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rMdLhxhBggsOrTSloTsNKzwr4+obOu7W94jrnnNHWtyAPG//OSdte/7T3WKrdRXqo5APPzPyp4/dSEhM92no8omYn8qjLp9Ui9I8bHnbV6vUXZ9zJxMXzJiWcY5GsKZvPnf/CzjR7rNOzCQAA0iQrsDEiQUkn4cUyG8RxDRiIkK5paox+fNHr6b2txLcVtw1sRUo+NTyVWIHzxvA+XBjA6OCb2DurbbgUiVmQPkhfAioP9mDNEzvxtSK4btGLH2FMenToSokShRoGopYVz2FZK6KA+umfdfJVicqR0TRJtGQVVPum+LwPr06fPnDBqODDQ+vxBwSYXIwaKG0dgFTU/N/oKiWNbmFNMg0/mmeiOBOeC8U/I+8i52IX1P2PX4gWBpE8FO0idbHyySU8SeJw4b8PxaNfIs3yAtqeLacMu4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c808b2a7-eb46-4b11-d6ca-08d6ce459b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 14:59:27.7424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K//IL9OHHSYjolMUGuI1zFgTUytfnIMWRhhal+hVu2M=;
 b=BZgnCIxfjx3FkAiWonNhteA0Ko4U3cL2HQVjjNkodpWhybDmlPLSDAZ596nAlDxOPSmtbmlxpgGpvJY3YY/ESIOV1Pre5ICwKgk3z9jsBoJgth/a7ACOv4rMcWcE6QUowyamFL84/e0QT9owX7TuNrh8p55SPVOhcJFmqB5eka0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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
Cc: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIEFNRCBjb21wdXRlIChhbWRrZmQpIGRyaXZlci4NCg0KQWxsIEFNRCBjb21wdXRlIGRldmlj
ZXMgYXJlIGV4cG9ydGVkIHZpYSBzaW5nbGUgZGV2aWNlIG5vZGUgL2Rldi9rZmQuIEFzDQphIHJl
c3VsdCBkZXZpY2VzIGNhbm5vdCBiZSBjb250cm9sbGVkIGluZGl2aWR1YWxseSB1c2luZyBkZXZp
Y2UgY2dyb3VwLg0KDQpBTUQgY29tcHV0ZSBkZXZpY2VzIHdpbGwgcmVseSBvbiBpdHMgZ3JhcGhp
Y3MgY291bnRlcnBhcnQgdGhhdCBleHBvc2VzDQovZGV2L2RyaS9yZW5kZXJOIG5vZGUgZm9yIGVh
Y2ggZGV2aWNlLiBGb3IgZWFjaCB0YXNrIChiYXNlZCBvbiBpdHMNCmNncm91cCksIEtGRCBkcml2
ZXIgd2lsbCBjaGVjayBpZiAvZGV2L2RyaS9yZW5kZXJOIG5vZGUgaXMgYWNjZXNzaWJsZQ0KYmVm
b3JlIGV4cG9zaW5nIGl0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBIYXJpc2ggS2FzaXZpc3dhbmF0aGFu
IDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogRmVsaXggS3Vl
aGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQotLS0NCiBzZWN1cml0eS9kZXZpY2VfY2dy
b3VwLmMgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdp
dCBhL3NlY3VyaXR5L2RldmljZV9jZ3JvdXAuYyBiL3NlY3VyaXR5L2RldmljZV9jZ3JvdXAuYw0K
aW5kZXggY2Q5NzkyOWZhYzY2Li5lM2E5YWQ1ZGI1YTAgMTAwNjQ0DQotLS0gYS9zZWN1cml0eS9k
ZXZpY2VfY2dyb3VwLmMNCisrKyBiL3NlY3VyaXR5L2RldmljZV9jZ3JvdXAuYw0KQEAgLTgyNCwz
ICs4MjQsNCBAQCBpbnQgX19kZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbihzaG9ydCB0eXBlLCB1
MzIgbWFqb3IsIHUzMiBtaW5vciwNCiANCiAJcmV0dXJuIDA7DQogfQ0KK0VYUE9SVF9TWU1CT0wo
X19kZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbik7DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
