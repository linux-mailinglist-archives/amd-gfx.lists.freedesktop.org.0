Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043DC9094
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBAA6E979;
	Wed,  2 Oct 2019 18:16:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D435C6E96B
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J78FeWG0PIAiNYb30VFTWDCDsY24yW1mN/esv+EEm1O3GJjvXQgwUNizOSfajKcCDkg4P0z8uo6n/EXts7Y41yuNVSFsCmkHLw2JoQqCIfWbzd23r2JLoT8DnaR7FKyVNgdxLJO6Tx7Ut1gN3o/6oqQ4l823NETlWstl2SHfIZj8bpyFbELtoSvXY9Ne/fGpM8YIVk4B/dLo9GGUMBkl18OBhBQpR69MpkWYCV9acemg7thsQ+bQWjs8f4bVRLi4AOl466qo0wQxyw//TjVv0m9m8NMU5LtNEGo10AbPTbSgmqsNQALiynSzi6J+vNqS7WM4HEeh6wcZNyAgaQbOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqydyLb2wiH3fNCuhtrIcycC7nkWZyI3iIwSWzKbOwI=;
 b=QTPL9KTK078sEiV1CqojVg+QGe7dOa5fWpN5XUb411uk3u9fTx91man+HZj5SFGI6Tn2wAshwAgW7pxP7lquMo3STF6eZR3ScSBp+idxdBl/TcPkR16fqQvbOxZmi+vlwS3qqDRaXQffJhckAOEgURlISVzW1lcjHT2uE/D8mRLCqQ6rc/k+/H7GTYlDJmqcCpjH8G1q6ngu6DoI2kNLGm0eskVr4x3GjmNJDae95AzVCSnUMNTdMoNMZYalZekgD3AuFoNC0POgZhsLKmiu6sVFfvXgmQnjTLjbYVXOTHNLUdJhuS29Fw0oHXD0lpUFQfo5fR4kyjX3K8muxmNC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0002.namprd12.prod.outlook.com (2603:10b6:4:1::12) by
 BN6PR12MB1252.namprd12.prod.outlook.com (2603:10b6:404:15::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:48 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM5PR12CA0002.outlook.office365.com
 (2603:10b6:4:1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:47 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:45 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 27/38] drm/amd/display: add new active dongle to existent w/a
Date: Wed, 2 Oct 2019 14:16:22 -0400
Message-ID: <20191002181633.22805-28-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(428003)(199004)(189003)(76176011)(36756003)(50226002)(2351001)(53416004)(50466002)(6916009)(5660300002)(8676002)(70206006)(70586007)(8936002)(81156014)(81166006)(316002)(305945005)(16586007)(2616005)(86362001)(47776003)(336012)(11346002)(1076003)(4326008)(486006)(356004)(48376002)(186003)(126002)(476003)(2906002)(446003)(426003)(7696005)(51416003)(478600001)(6666004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1252; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5257abc8-9e78-4bac-b22f-08d74764b07c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1252:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1252FF861A80CA1AD34751ABF99C0@BN6PR12MB1252.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BddSgH9+OZDR63ga5XB1UZoRjpadhPpO+ecMdpbCNMczEjJdMsna7cAB07zO3Bc3RI2U3fhs6XAAHV/ijD2rcpgjObsdjbKJJoNczh7pxX1BvrMOjdqZt0OtOgsPjBn8MtzWRp5XkGMuDR4ebLU6dOciyJuK4u9pEm/6S9DuxAZfPMA2EISqsaMbTZTqbN6qMMbvfY8hk+Bw3FP8r8iIPkBXs4pzMSLTy4nbJ8nGSb32xi8OVL8tUoYkWaZLxR8FSZWUcw8ncZOqz7bQH6I71D0BSLPuxqV3OHHbaJlEn7bYBwC0TNGWRkOLE+7x6M1r+55HnSsowaCHoH0re6vziobm7lBkKaQKu9u8lssrAsQFJKr1qY0+uMvbAzv5eTR5FbmbihyhGr0LJ2qlTrUyQQB7+JE5aQoN4FCwKbKCmdY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:47.8127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5257abc8-9e78-4bac-b22f-08d74764b07c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1252
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqydyLb2wiH3fNCuhtrIcycC7nkWZyI3iIwSWzKbOwI=;
 b=d4Y730nNd0ve0Kf/HKe7n0QnkP9xaVROfDtEdGJf9L9/Bu7PWPbGlRjbqUvULmhEoADwGt94+3VJOpmYcQmOt1vBgrR0ZA313qm76OWHihtHbkeXdEqP0jjUdVq89qmT5ZNxip+r+obcmWrT/OXOuAC6Spqy3dEXUroQyt8a8rU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+CgpbV2h5ICYgSG93
XQpEb25nbGUgMHgwMEUwNEMgcG93ZXIgZG93biBhbGwgaW50ZXJuYWwgY2lyY3VpdHMgaW5jbHVk
aW5nCkFVWCBjb21tdW5pY2F0aW9uIHByZXZlbnRpbmcgcmVhZGluZyBEUENEIHRhYmxlLgpFbmNv
ZGVyIHdpbGwgc2tpcCBEUCBSWCBwb3dlciBkb3duIG9uIGRpc2FibGUgb3V0cHV0CnRvIGtlZXAg
cmVjZWl2ZXIgcG93ZXJlZCBhbGwgdGhlIHRpbWUuCgpDaGFuZ2UtSWQ6IEk3NDAxYTg4YmUxZGMx
NWZkNDVhYjFiNDk2NGI3OWJhMzE4NGU3NjEwClNpZ25lZC1vZmYtYnk6IFZpdGFseSBQcm9zeWFr
IDx2aXRhbHkucHJvc3lha0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFy
bGVuZS5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVl
dC5MYWtoYUBhbWQuY29tPgpBY2tlZC1ieTogVml0YWx5IFByb3N5YWsgPFZpdGFseS5Qcm9zeWFr
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
a19kcC5jICAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUv
ZGRjX3NlcnZpY2VfdHlwZXMuaCB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
bGlua19kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19k
cC5jCmluZGV4IDY0OWVkMzFjY2ZlNS4uYWFlMjA0MTQxYzYwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCkBAIC0yNzIxLDYgKzI3MjEs
NyBAQCBzdGF0aWMgdm9pZCBkcF93YV9wb3dlcl91cF8wMDEwRkEoc3RydWN0IGRjX2xpbmsgKmxp
bmssIHVpbnQ4X3QgKmRwY2RfZGF0YSwKIAkJICoga2VlcCByZWNlaXZlciBwb3dlcmVkIGFsbCB0
aGUgdGltZS4qLwogCQljYXNlIERQX0JSQU5DSF9ERVZJQ0VfSURfMDAxMEZBOgogCQljYXNlIERQ
X0JSQU5DSF9ERVZJQ0VfSURfMDA4MEUxOgorCQljYXNlIERQX0JSQU5DSF9ERVZJQ0VfSURfMDBF
MDRDOgogCQkJbGluay0+d2FfZmxhZ3MuZHBfa2VlcF9yZWNlaXZlcl9wb3dlcmVkID0gdHJ1ZTsK
IAkJCWJyZWFrOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5j
bHVkZS9kZGNfc2VydmljZV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2lu
Y2x1ZGUvZGRjX3NlcnZpY2VfdHlwZXMuaAppbmRleCAxODk2MTcwN2RiMjMuLjlhZDQ5ZGE1MGEx
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3Nl
cnZpY2VfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9k
ZGNfc2VydmljZV90eXBlcy5oCkBAIC0zMSw2ICszMSw4IEBACiAjZGVmaW5lIERQX0JSQU5DSF9E
RVZJQ0VfSURfMDAyMkI5IDB4MDAyMkI5CiAjZGVmaW5lIERQX0JSQU5DSF9ERVZJQ0VfSURfMDAw
MDFBIDB4MDAwMDFBCiAjZGVmaW5lIERQX0JSQU5DSF9ERVZJQ0VfSURfMDA4MEUxIDB4MDA4MGUx
CisjZGVmaW5lIERQX0JSQU5DSF9ERVZJQ0VfSURfOTBDQzI0IDB4OTBDQzI0CisjZGVmaW5lIERQ
X0JSQU5DSF9ERVZJQ0VfSURfMDBFMDRDIDB4MDBFMDRDCiAKIGVudW0gZGRjX3Jlc3VsdCB7CiAJ
RERDX1JFU1VMVF9VTktOT1dOID0gMCwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
