Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ED7E8A13
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Oct 2019 14:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731A86E3C1;
	Tue, 29 Oct 2019 13:53:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730058.outbound.protection.outlook.com [40.107.73.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD656E3B5;
 Tue, 29 Oct 2019 13:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDMG/bUoZofzJRDb0MejvniST/wcEOSGB72SNnw7XMF+qeyrY3TAn2tb34CPS6jmnqpSV506ymr0+8UCBskbpQzA0bjfqw9duPj48W4bXCMhY9bKUhUkcUOTEDsbBWtJ+HRCPQ3qr0CjSScGS4BiVkJpOgnKQ443tdwHiABvp9sBY9sHDaRICiDajJWwHb4iC8qrFhExG11hMPvbnBkiEj+beS7LcykoenFsmXY4Ux5Fa23uJpOmzANYxuXvN+pp0GgsAPYe3kGXHNUHQkXnaK1f5kSYX8QU7jks9LLMDjxx5Jf6tTc3yPHnuypeSKpHbbtbt1qiDAtP3hkMbPIKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JgIGw5uDAPqC+2ghLVNL6FJSl4yKmT3Mvd49Z942tQ=;
 b=SQdDYmu5cgxjeEziZVRsPskzATsHHEFxDiQsfx+CVtaYQkN26HUFDtqzkCTKr2qjMAnGnaNWRSnNzls9NW17F68yVQlYClDhZdOUoz1Z7XawX41Gkc1QIQ+8oyKs/q+4xgYnKdvLrFpKxQvwNR5KnrR7aY20I1qvJ5gsYJ7wy/PbDlQIJdfvwblVOIvnKz6DkwMiWFIkUXP3uycyX8Rm5m735vQgXiRdgLTd9UQtDVMeQbm9woUaHv3o6BK0O1Ll+a0gBV8YKdjUz3ekeAyO1Zsa5QlwBXkw0BsP8T3EyxdxjDArXnsg07q5L4+ET2zqPLWxgMM48bc9ZcliNR5xTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:610:57::40)
 by BN6PR12MB1460.namprd12.prod.outlook.com (2603:10b6:405:11::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 13:52:57 +0000
Received: from CO1NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by CH2PR12CA0030.outlook.office365.com
 (2603:10b6:610:57::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via Frontend
 Transport; Tue, 29 Oct 2019 13:52:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT011.mail.protection.outlook.com (10.152.80.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:52:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:55 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:55 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:52:55 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/13] drm/dp_mst: Add helpers for MST DSC and virtual DPCD aux
Date: Tue, 29 Oct 2019 09:52:38 -0400
Message-ID: <20191029135245.31152-7-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135245.31152-1-mikita.lipski@amd.com>
References: <20191029135245.31152-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(428003)(189003)(199004)(50466002)(8936002)(53416004)(47776003)(50226002)(305945005)(54906003)(51416003)(1076003)(76176011)(6916009)(16586007)(316002)(2351001)(8676002)(7696005)(356004)(81156014)(81166006)(6666004)(36756003)(2906002)(186003)(26005)(14444005)(336012)(5024004)(48376002)(446003)(426003)(4326008)(86362001)(2616005)(70206006)(11346002)(476003)(70586007)(478600001)(5660300002)(2876002)(126002)(486006)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1460; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf92675c-fa74-4526-b382-08d75c774d7e
X-MS-TrafficTypeDiagnostic: BN6PR12MB1460:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1460E404A888276DFBE749F6E4610@BN6PR12MB1460.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: met5h1DD+l8oroCHUV4WrtCV37ispS7qW4OZZf2/XlEDxoBc08fcLgE4DPborFaFDwx2kC8i3eRTcKw9NDdzWzqzwkA6wtbS5nfDmsVMOff4VeTa1ZY2MLoSF+hDEMqC1NsW4qkZ0kqqPHvxqfIm3g8d2HkZzgyvzjQqZlBy1/LjwbTac09kvfFau4CiqsY6hb4FJpQR3MNxOSMSKMxRZx07bg6QrTYJO4gXovSnIL4X+1dm0IcwzO16b55prCcV9WI9BuwVpAMe/iOlAvrVazMoYdbCVYawgSdL/DE9CFdCwDhOe2RUxqLtbyDEL6x5q0yPKFLhM+rgVVW0zkakouL6GA3KufsVInw3+wRdgXO8bTB79KGTsilriyABPzFUbVRZYI0i2s7yiYPy6iJ8GeXqt7ps1PF/lsavOKAUegXwmehigm+pbbeb8kOXFTlW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:52:56.5575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf92675c-fa74-4526-b382-08d75c774d7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1460
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JgIGw5uDAPqC+2ghLVNL6FJSl4yKmT3Mvd49Z942tQ=;
 b=Jf3NcWd/X8ptUt161pKymzdDeK7mwbxMM1WLw113Ve+dBgBg+BfNdIb//Glyugje5WtlLsevAr1w1Fz0yGIuQ1wuLKPor4Y7GTkwamWRfhf9Eld3qFn+k+k19R5M5UQ3sTsOdEkC0UQzkNQt6gehJ8fureAkOxbaUQ3Etn3Y45Y=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKQWRkIGRybV9kcF9t
c3RfZHNjX2F1eF9mb3JfcG9ydC4gVG8gZW5hYmxlIERTQywgdGhlIERTQ19FTkFCTEVECnJlZ2lz
dGVyIG1pZ2h0IGhhdmUgdG8gYmUgd3JpdHRlbiBvbiB0aGUgbGVhZiBwb3J0J3MgRFBDRCwKaXRz
IHBhcmVudCdzIERQQ0QsIG9yIHRoZSBNU1QgbWFuYWdlcidzIERQQ0QuIFRoaXMgZnVuY3Rpb24K
ZmluZHMgdGhlIGNvcnJlY3QgYXV4IGZvciB0aGUgam9iLgoKQXMgcGFydCBvZiB0aGlzLCBhZGQg
ZHJtX2RwX21zdF9pc192aXJ0dWFsX2RwY2QuIFZpcnR1YWwgRFBDRAppcyBhIERQIGZlYXR1cmUg
bmV3IGluIERQIHYxLjQsIHdoaWNoIGV4cG9zZXMgY2VydGFpbiBEUENECnJlZ2lzdGVycyBvbiB2
aXJ0dWFsIHBvcnRzLgoKdjI6IFJlbWVtYmVyIHRvIHVubG9jayBtdXRleCBvbiBhbGwgcGF0aHMK
djM6IFJlZmFjdG9yIHRvIG1hdGNoIGNvZGluZyBzdHlsZSBhbmQgaW5jcmVhc2UgYnJldml0eQoK
UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBX
ZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJh
bmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMgfCAxMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUv
ZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgfCAgIDIgKwogMiBmaWxlcyBjaGFuZ2VkLCAx
MjkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4
IDUwMjkyM2MyNDQ1MC4uZDhmOWJhMjdiNTU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKQEAgLTQxNTAsMyArNDE1MCwxMzAgQEAgc3RhdGljIHZvaWQgZHJtX2RwX21zdF91
bnJlZ2lzdGVyX2kyY19idXMoc3RydWN0IGRybV9kcF9hdXggKmF1eCkKIHsKIAlpMmNfZGVsX2Fk
YXB0ZXIoJmF1eC0+ZGRjKTsKIH0KKworLyoqCisgKiBkcm1fZHBfbXN0X2lzX3ZpcnR1YWxfZHBj
ZCgpIC0gSXMgdGhlIGdpdmVuIHBvcnQgYSB2aXJ0dWFsIERQIFBlZXIgRGV2aWNlCisgKiBAcG9y
dDogVGhlIHBvcnQgdG8gY2hlY2sKKyAqCisgKiBBIHNpbmdsZSBwaHlzaWNhbCBNU1QgaHViIG9i
amVjdCBjYW4gYmUgcmVwcmVzZW50ZWQgaW4gdGhlIHRvcG9sb2d5CisgKiBieSBtdWx0aXBsZSBi
cmFuY2hlcywgd2l0aCB2aXJ0dWFsIHBvcnRzIGJldHdlZW4gdGhvc2UgYnJhbmNoZXMuCisgKgor
ICogQXMgb2YgRFAxLjQsIEFuIE1TVCBodWIgd2l0aCBpbnRlcm5hbCAodmlydHVhbCkgcG9ydHMg
bXVzdCBleHBvc2UKKyAqIGNlcnRhaW4gRFBDRCByZWdpc3RlcnMgb3ZlciB0aG9zZSBwb3J0cy4g
U2VlIHNlY3Rpb25zIDIuNi4xLjEuMQorICogYW5kIDIuNi4xLjEuMiBvZiBEaXNwbGF5IFBvcnQg
c3BlY2lmaWNhdGlvbiB2MS40IGZvciBkZXRhaWxzLgorICoKKyAqIE1heSBhY3F1aXJlIG1nci0+
bG9jaworICoKKyAqIFJldHVybnM6CisgKiB0cnVlIGlmIHRoZSBwb3J0IGlzIGEgdmlydHVhbCBE
UCBwZWVyIGRldmljZSwgZmFsc2Ugb3RoZXJ3aXNlCisgKi8KK3N0YXRpYyBib29sIGRybV9kcF9t
c3RfaXNfdmlydHVhbF9kcGNkKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCit7CisJc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqZG93bnN0cmVhbV9wb3J0OworCisJaWYgKCFwb3J0IHx8IHBv
cnQtPmRwY2RfcmV2IDwgRFBfRFBDRF9SRVZfMTQpCisJCXJldHVybiBmYWxzZTsKKworCS8qIFZp
cnR1YWwgRFAgU2luayAoSW50ZXJuYWwgRGlzcGxheSBQYW5lbCkgKi8KKwlpZiAocG9ydC0+cG9y
dF9udW0gPj0gOCkKKwkJcmV0dXJuIHRydWU7CisKKwkvKiBEUC10by1IRE1JIFByb3RvY29sIENv
bnZlcnRlciAqLworCWlmIChwb3J0LT5wZHQgPT0gRFBfUEVFUl9ERVZJQ0VfRFBfTEVHQUNZX0NP
TlYgJiYKKwkgICAgIXBvcnQtPm1jcyAmJgorCSAgICBwb3J0LT5sZHBzKQorCQlyZXR1cm4gdHJ1
ZTsKKworCS8qIERQLXRvLURQICovCisJbXV0ZXhfbG9jaygmcG9ydC0+bWdyLT5sb2NrKTsKKwlp
ZiAocG9ydC0+cGR0ID09IERQX1BFRVJfREVWSUNFX01TVF9CUkFOQ0hJTkcgJiYKKwkgICAgcG9y
dC0+bXN0YiAmJgorCSAgICBwb3J0LT5tc3RiLT5udW1fcG9ydHMgPT0gMikgeworCQlsaXN0X2Zv
cl9lYWNoX2VudHJ5KGRvd25zdHJlYW1fcG9ydCwgJnBvcnQtPm1zdGItPnBvcnRzLCBuZXh0KSB7
CisJCQlpZiAoZG93bnN0cmVhbV9wb3J0LT5wZHQgPT0gRFBfUEVFUl9ERVZJQ0VfU1NUX1NJTksg
JiYKKwkJCSAgICAhZG93bnN0cmVhbV9wb3J0LT5pbnB1dCkgeworCQkJCW11dGV4X3VubG9jaygm
cG9ydC0+bWdyLT5sb2NrKTsKKwkJCQlyZXR1cm4gdHJ1ZTsKKwkJCX0KKwkJfQorCX0KKwltdXRl
eF91bmxvY2soJnBvcnQtPm1nci0+bG9jayk7CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKKy8qKgor
ICogZHJtX2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KCkgLSBGaW5kIHRoZSBjb3JyZWN0IGF1eCBm
b3IgRFNDCisgKiBAcG9ydDogVGhlIHBvcnQgdG8gY2hlY2suIEEgbGVhZiBvZiB0aGUgTVNUIHRy
ZWUgd2l0aCBhbiBhdHRhY2hlZCBkaXNwbGF5LgorICoKKyAqIERlcGVuZGluZyBvbiB0aGUgc2l0
dWF0aW9uLCBEU0MgbWF5IGJlIGVuYWJsZWQgdmlhIHRoZSBlbmRwb2ludCBhdXgsCisgKiB0aGUg
aW1tZWRpYXRlbHkgdXBzdHJlYW0gYXV4LCBvciB0aGUgY29ubmVjdG9yJ3MgcGh5c2ljYWwgYXV4
LgorICoKKyAqIFRoaXMgaXMgYm90aCB0aGUgY29ycmVjdCBhdXggdG8gcmVhZCBEU0NfQ0FQQUJJ
TElUWSBhbmQgdGhlCisgKiBjb3JyZWN0IGF1eCB0byB3cml0ZSBEU0NfRU5BQkxFRC4KKyAqCisg
KiBUaGlzIG9wZXJhdGlvbiBjYW4gYmUgZXhwZW5zaXZlICh1cCB0byBmb3VyIGF1eCByZWFkcyks
IHNvCisgKiB0aGUgY2FsbGVyIHNob3VsZCBjYWNoZSB0aGUgcmV0dXJuLgorICoKKyAqIFJldHVy
bnM6CisgKiBOVUxMIGlmIERTQyBjYW5ub3QgYmUgZW5hYmxlZCBvbiB0aGlzIHBvcnQsIG90aGVy
d2lzZSB0aGUgYXV4IGRldmljZQorICovCitzdHJ1Y3QgZHJtX2RwX2F1eCAqZHJtX2RwX21zdF9k
c2NfYXV4X2Zvcl9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCit7CisJc3RydWN0
IGRybV9kcF9tc3RfcG9ydCAqaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQ7CisJc3RydWN0IGRybV9k
cF9tc3RfcG9ydCAqZmVjX3BvcnQ7CisKKwlpZiAoIXBvcnQpCisJCXJldHVybiBOVUxMOworCisJ
aWYgKHBvcnQtPnBhcmVudCkKKwkJaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQgPSBwb3J0LT5wYXJl
bnQtPnBvcnRfcGFyZW50OworCWVsc2UKKwkJaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQgPSBOVUxM
OworCisJZmVjX3BvcnQgPSBpbW1lZGlhdGVfdXBzdHJlYW1fcG9ydDsKKwl3aGlsZSAoZmVjX3Bv
cnQpIHsKKwkJLyoKKwkJICogRWFjaCBwaHlzaWNhbCBsaW5rIChpLmUuIG5vdCBhIHZpcnR1YWwg
cG9ydCkgYmV0d2VlbiB0aGUKKwkJICogb3V0cHV0IGFuZCB0aGUgcHJpbWFyeSBkZXZpY2UgbXVz
dCBzdXBwb3J0IEZFQworCQkgKi8KKwkJaWYgKCFkcm1fZHBfbXN0X2lzX3ZpcnR1YWxfZHBjZChm
ZWNfcG9ydCkgJiYKKwkJICAgICFmZWNfcG9ydC0+ZmVjX2NhcGFibGUpCisJCQlyZXR1cm4gTlVM
TDsKKworCQlmZWNfcG9ydCA9IGZlY19wb3J0LT5wYXJlbnQtPnBvcnRfcGFyZW50OworCX0KKwor
CS8qIERQLXRvLURQIHBlZXIgZGV2aWNlICovCisJaWYgKGRybV9kcF9tc3RfaXNfdmlydHVhbF9k
cGNkKGltbWVkaWF0ZV91cHN0cmVhbV9wb3J0KSkgeworCQl1OCB1cHN0cmVhbV9kc2M7CisJCXU4
IGVuZHBvaW50X2RzYzsKKwkJdTggZW5kcG9pbnRfZmVjOworCisJCWlmIChkcm1fZHBfZHBjZF9y
ZWFkKCZwb3J0LT5hdXgsCisJCQkJICAgICBEUF9EU0NfU1VQUE9SVCwgJmVuZHBvaW50X2RzYywg
MSkgPCAwKQorCQkJcmV0dXJuIE5VTEw7CisJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZwb3J0LT5h
dXgsCisJCQkJICAgICBEUF9GRUNfQ0FQQUJJTElUWSwgJmVuZHBvaW50X2ZlYywgMSkgPCAwKQor
CQkJcmV0dXJuIE5VTEw7CisJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZpbW1lZGlhdGVfdXBzdHJl
YW1fcG9ydC0+YXV4LAorCQkJCSAgICAgRFBfRFNDX1NVUFBPUlQsICZ1cHN0cmVhbV9kc2MsIDEp
IDwgMCkKKwkJCXJldHVybiBOVUxMOworCisJCS8qIEVucG9pbnQgZGVjb21wcmVzc2lvbiB3aXRo
IERQLXRvLURQIHBlZXIgZGV2aWNlICovCisJCWlmICgoZW5kcG9pbnRfZHNjICYgRFBfRFNDX0RF
Q09NUFJFU1NJT05fSVNfU1VQUE9SVEVEKSAmJgorCQkgICAgKGVuZHBvaW50X2ZlYyAmIERQX0ZF
Q19DQVBBQkxFKSAmJgorCQkgICAgKHVwc3RyZWFtX2RzYyAmIDB4MikgLyogRFNDIHBhc3N0aHJv
dWdoICovKQorCQkJcmV0dXJuICZwb3J0LT5hdXg7CisKKwkJLyogVmlydHVhbCBEUENEIGRlY29t
cHJlc3Npb24gd2l0aCBEUC10by1EUCBwZWVyIGRldmljZSAqLworCQlyZXR1cm4gJmltbWVkaWF0
ZV91cHN0cmVhbV9wb3J0LT5hdXg7CisJfQorCisJLyogVmlydHVhbCBEUENEIGRlY29tcHJlc3Np
b24gd2l0aCBEUC10by1IRE1JIG9yIFZpcnR1YWwgRFAgU2luayAqLworCWlmIChkcm1fZHBfbXN0
X2lzX3ZpcnR1YWxfZHBjZChwb3J0KSkKKwkJcmV0dXJuICZwb3J0LT5hdXg7CisKKwlyZXR1cm4g
TlVMTDsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KTsKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IGYxMTNhZTA0ZmE4OC4uNGNmNzM4NTQ1ZGZiIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTY3Myw2ICs2NzMsOCBAQCBpbnQgX19tdXN0X2NoZWNr
IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7
CiB2b2lkIGRybV9kcF9tc3RfZ2V0X3BvcnRfbWFsbG9jKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQg
KnBvcnQpOwogdm9pZCBkcm1fZHBfbXN0X3B1dF9wb3J0X21hbGxvYyhzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0ICpwb3J0KTsKIAorc3RydWN0IGRybV9kcF9hdXggKmRybV9kcF9tc3RfZHNjX2F1eF9m
b3JfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KTsKKwogZXh0ZXJuIGNvbnN0IHN0
cnVjdCBkcm1fcHJpdmF0ZV9zdGF0ZV9mdW5jcyBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlX2Z1
bmNzOwogCiAvKioKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
