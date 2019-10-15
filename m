Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6FD79A5
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 17:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A232889D8E;
	Tue, 15 Oct 2019 15:23:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680060.outbound.protection.outlook.com [40.107.68.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBD389D8E
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 15:23:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxV65GtNM0dwiuYoW17zfpBOsByBlAkVNkIUphtTy9x8CPbXAa6eCOWhCqALWdwzmUksa/Ul+BC0qURUOUPYv2JPoKP/aOcqVUDAAOM8WBX+r2XBLGdQUivkOR+xAFXLik7rRSxkjHLYfqCOwlgNmP0wFO3HyvVW42lsJzKTH6ejrC8/1URpow612ozVfQ1a9mqWLa2yBRJBlYPPpUBDxvYo9rvcuwsYWNYFQMSTan87QXB/fGtg9sfPFEJOGxthUJ+DxJbl0ZVXM+MazUtCmqUDZ3I2SwgB4VR7JiGJNUr5yteH9fypzHkK05Y+zq+1yLqQkmd9qDnrBFTXHa8ywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcnB1mCcaGFBjiJ04VmB7bRFKFtau7uoJn1CgHAAo1M=;
 b=ZIb3gthi7JEFq7GklSP9OPa8W8JQ3/N66c221geMjwFvHgPA3mOjlcS6PGxeNz2ADFSkEXNUCAKVLf3jdAA97HFbFa49CcYgRnHK1SRx4oqpcgf7HPphupIcLhSXQ2a+n0f+o71gwEKBffb+8JJ9u6AdWoU2a5nnSPADiBEr7L79bzcRthVyFe5QeFek7sFtRh9M1ZVRozjcBfbjx+eAn+VBFrgtu+1AHsXlbRX7Zwg5d4ozxSxcqDsTwy7wfgeIhs08t0uVabLTNaofzuqM6AEUHl0ljAcImVQhn1JQZnsqdgIHwdTKa328Rzy1yNDwPTOaDDjkU3CQLAKcRJjKRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1952.namprd12.prod.outlook.com (10.175.56.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Tue, 15 Oct 2019 15:23:20 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d%4]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 15:23:20 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>
Subject: Compilation breaks on drm-next by commit 002c988
Thread-Topic: Compilation breaks on drm-next by commit 002c988
Thread-Index: AQHVg2x5DUaNKSqzikyK/h24WnrT/Q==
Date: Tue, 15 Oct 2019 15:23:20 +0000
Message-ID: <7b1e6b14-1567-be66-008c-6a50671e50bf@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::26) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ea75443-baa1-41e4-d30c-08d751839c44
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1952:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1952698A15684F01CE793AB6EA930@MWHPR12MB1952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(189003)(199004)(66446008)(64756008)(66556008)(66476007)(66946007)(6436002)(558084003)(316002)(37006003)(4326008)(6862004)(478600001)(6636002)(5660300002)(31696002)(86362001)(8936002)(6486002)(6512007)(36756003)(81166006)(81156014)(8676002)(186003)(256004)(71200400001)(71190400001)(386003)(486006)(476003)(2616005)(3846002)(6116002)(102836004)(52116002)(26005)(6506007)(25786009)(31686004)(14454004)(305945005)(7736002)(66066001)(99286004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1952;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sxPReJcu4i4ySM8VlVyNLC4uX2PMx/ZGZDT11oQS1ACmXhO3c1+qXKey678QdLwN5IsZdXKFfYEme380p5ZtIF2V3TegDKHIOXJ9TDNM9CMSEInKq9olDbTQnUs17qJOUwDlMUI7Svi7ruTNS5nO5GUeiPWFP5y50wrQ6GcJeoUJEVLJsVwCNDwDnCO3nDguU+SJwnutuWBpw3qIIKH/EEQht14SStW9yHPxD+IroU5OsA+s07jrK66YpgvfB+Eb1KZvgx5ljJm/qLd81u+hFaUbPyNAK0XRa50xKnsTelaspKkOZ+7JHrNewHCpBtEyJbTJoMFxLPfelnIQTVmUGy8HM1fcik866Ex+uIxWS5n5uS9gXmYsNhFc8Wtj7LqF5LMj2J01Ea+WTk77qAg/RSCkgp5HuikcY7c/d4y1qJs=
Content-ID: <4ED52C884C56C04CBDB2B97C9325E710@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea75443-baa1-41e4-d30c-08d751839c44
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 15:23:20.2595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1fDmklenR4jE22MjgpKmGeceb6CAXAdFI2hWNDieaTpxKcPvwq2EkNGvHDuhX7DBtZ/FWkftsPo987CUJSyIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1952
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcnB1mCcaGFBjiJ04VmB7bRFKFtau7uoJn1CgHAAo1M=;
 b=A9IE7vgap0xAa0mWEkLH6Gu76Z+Ua5cW/PtNHymHEEBcQAJ4P+UAMnw6ERmSyuvrrRyrcUQpY8VSTqfzEDiUdC8KN3z9aYqJuCu/81vAsJerEAS0vbK3buEnCj9hCjZHSGHkFZ6DGzFzIb5ocsyRplclm7zC/82kcglRdoZsILE=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVyc2VuIC0gdGhlIGNoYW5nZSAwMDJjOTg4ICdkcm0vYW1kZ3B1L3Bvd2VycGxheTogYWRkIHJl
bm9pciBmdW5jcyB0byANCnN1cHBvcnQgZGMnIHNlZWVtcyB0byBicmVhayBjb21waWxhdGlvbiBv
biBkcm0tbmV4dCBiZWNhdXNlIA0KcmVub2lyX2dldF9kcG1fY2xvY2tfdGFibGUgdXNlcyBkZWZp
bmVzIGFuZCBzdHJ1Y3RzIGZyb20gDQphbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaCB3aGljaCBh
cmUgdW5kZXIgQ09ORklHX0RSTV9BTURfRENfRENOMl8xDQoNCkFuZHJleQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
